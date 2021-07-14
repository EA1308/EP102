//
//  DetailInfoDataSource.swift
//  EP102
//
//  Created by MacBook  on 14.07.21.
//

import UIKit

class DetailInfoDataSource: NSObject {
    private var tableView: UITableView!
    var product: Product?
    
    init(with tableView: UITableView) {
        super.init()
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.separatorStyle = .none
    }
    
}

extension DetailInfoDataSource: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        if indexPath.row == 0 {
            let cell = tableView.deque(ImageCell.self, for: indexPath)
            cell.configure(with: product)
            return cell
        }
        
        if indexPath.row == 1 {
            let cell = tableView.deque(DescriptionCell.self, for: indexPath)
            cell.configure(with: product)
            return cell
        }
        
        return cell

    }

}
