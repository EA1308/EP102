//
//  HomeViewController.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import UIKit

class HomeViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var dataSource: HomeDataSource!
    private var viewModel: HomeViewModelProtocol!
    private var productsManager: ProductsManagerProtocol!
    private var categoryManager: CategoryManagerProtocol!
    private var recentlyViewedManager: RecentlyViewedManagerProtocol!
    private var savedManager:SavedProductManagerProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        configureDataSource()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    private func setupTableView() {
        tableView.separatorStyle = .none
        tableView.registerNib(class: WideCell.self)
        tableView.registerNib(class: ProductCell.self)
        tableView.registerNib(class: RecentlyViewedCell.self)
        tableView.registerNib(class: SavedCell.self)
    }
    
    func configureDataSource() {
        productsManager = ProductManager()
        categoryManager = CategoryManager()
        recentlyViewedManager = RecentlyViewedManager()
        savedManager = SavedProductManager()
        viewModel = HomeViewModel(with: productsManager, categoryManager: categoryManager, recentlyViewedManager: recentlyViewedManager, savedManager: savedManager, controller: self)
        dataSource = HomeDataSource(with: tableView, viewModel: viewModel)
        dataSource.refresh()
    }
}
