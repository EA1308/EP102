//
//  DetailInfoViewController.swift
//  EP102
//
//  Created by MacBook  on 14.07.21.
//

import UIKit

class DetailInfoViewController: BaseViewController {

    @IBOutlet weak var tableView: UITableView!
    var product: Product?
    private var dataSource: DetailInfoDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureDataSource()
        tableView.registerNib(class: ImageCell.self)
        tableView.registerNib(class: DescriptionCell.self)
        navigationController?.isNavigationBarHidden = false
        navigationItem.title = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        navigationItem.title = nil
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)

    }
    
    func configureDataSource() {
        dataSource = DetailInfoDataSource(with: tableView)
        dataSource.product = product
    }


}
