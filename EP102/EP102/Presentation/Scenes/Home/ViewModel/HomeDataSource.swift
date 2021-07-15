//
//  HomeDataSource.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import UIKit


class HomeDataSource: NSObject {
    private var tableView: UITableView!
    private var viewModel: HomeViewModelProtocol!
    var productsList: [Product]?
    var categoryList: [Product]?
    var recentlyViewedProductsList: [Product]?
    var savedItems: [SavedProduct]?
    var brandList: [Brand]?
    
    
    init(with tableView: UITableView, viewModel: HomeViewModelProtocol) {
        super.init()
        self.tableView = tableView
        self.tableView.dataSource = self
        self.tableView.delegate = self

        self.viewModel = viewModel
    }
    
    func refresh() {
        viewModel.fetchProducts { [weak self] productsList in
            self?.productsList = productsList
            self?.tableView.reloadData()
        }
        viewModel.fetchCategory { [weak self] categories in
            self?.categoryList = categories
            self?.tableView.reloadData()
        }
        viewModel.fetchRecentlyViewed { [weak self] recentlyViewedProducts in
            self?.recentlyViewedProductsList = recentlyViewedProducts
            self?.tableView.reloadData()
        }
        
        viewModel.fetchSaved { [weak self] savedItemsList  in
            self?.savedItems = savedItemsList
            self?.tableView.reloadData()
        }
        viewModel.fetchBrands { [weak self] brands in
            self?.brandList = brands
            self?.tableView.reloadData()
        }
        
    }
    
    
}

extension HomeDataSource: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let cellIndex = indexPath.row
        cell.selectionStyle = .none
        if cellIndex == 0 {
            let cell = tableView.deque(WideCell.self, for: indexPath)
            cell.configureNewTrend()
            cell.selectionStyle = .none

            return cell
        }
        
        if cellIndex == 1 {
            let cell = tableView.deque(ProductCell.self, for: indexPath)
            cell.configure(with: categoryList ?? [])
            return cell
        }
        
        if indexPath.row == 2 {
            let cell = tableView.deque(WideCell.self, for: indexPath)
            cell.configureStrippes()
            return cell
        }
        
        if indexPath.row == 3 {
            let cell = tableView.deque(WideCell.self, for: indexPath)
            cell.configureSummerSea()
            return cell
        }
        
        if indexPath.row == 4 {
            let cell = tableView.deque(RecentlyViewedCell.self, for: indexPath)
            cell.configure(with: recentlyViewedProductsList)
            return cell
        }
        
        if indexPath.row == 5 {
            let cell = tableView.deque(SavedCell.self, for: indexPath)
            cell.configure(with: savedItems)
            return cell
        }
        
        if indexPath.row == 6 {
            let cell = tableView.deque(BrandsCell.self, for: indexPath)
            cell.configure(with: brandList)
            return cell
        }
        
        if indexPath.row == 7 {
            let cell = tableView.deque(ShoppingHabitsCell.self, for: indexPath)
            cell.configure(with: recentlyViewedProductsList)
            return cell
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            viewModel.controller.coordinator?.proceedToNewTrends()
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0, 2, 3 :
            return 190
        case 1:
            return 450
        case 4:
            return 280
        case 5:
            return 295
        case 6:
            return 300
        case 7:
            return 280
        default:
            return UITableView.automaticDimension
        }
    }
    
    

}
