//
//  DetailInfoDataSource.swift
//  EP102
//
//  Created by MacBook  on 14.07.21.
//

import UIKit

class DetailInfoDataSource: NSObject {
    private var tableView: UITableView!
    
    init(with tableView: UITableView) {
        self.tableView = tableView
     //   self.tableView.dataSource = self
    }
    
}

//extension DetailInfoDataSource: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }
//
//
//}
