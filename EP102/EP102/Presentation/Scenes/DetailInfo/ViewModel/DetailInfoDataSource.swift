//
//  DetailInfoDataSource.swift
//  EP102
//
//  Created by MacBook  on 14.07.21.
//

import UIKit

class DetailInfoDataSource: NSObject {
    private var tableView: UITableView!
    let index: Int?
    
    init(with tableView: UITableView) {
        self.tableView = tableView
     //   self.tableView.dataSource = self
    }
    
}

extension DetailInfoDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.deque(ImageCell.self, for: indexPath)
            cell.conf
        }

    }


}
