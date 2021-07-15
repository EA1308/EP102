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
    private var brandsManager: BrandManagerProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDataSource()

        setupTableView()
        
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
        tableView.registerNib(class: BrandsCell.self)
        tableView.registerNib(class: ShoppingHabitsCell.self)
    }
    
    func configureDataSource() {
        productsManager = ProductManager()
        categoryManager = CategoryManager()
        recentlyViewedManager = RecentlyViewedManager()
        savedManager = SavedProductManager()
        brandsManager = BrandManager()
        viewModel = HomeViewModel(with: productsManager, categoryManager: categoryManager, recentlyViewedManager: recentlyViewedManager, savedManager: savedManager, brandManager: brandsManager, controller: self)
        dataSource = HomeDataSource(with: tableView, viewModel: viewModel)
        dataSource.refresh()
      
    }
}
