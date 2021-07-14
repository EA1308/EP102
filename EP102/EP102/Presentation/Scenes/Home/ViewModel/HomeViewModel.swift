//
//  HomeViewModel.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import UIKit

protocol HomeViewModelProtocol {
    func fetchProducts(completion: @escaping ([Product]) -> Void)
    func fetchCategory(completion: @escaping ([Product]) -> Void)
    func fetchRecentlyViewed(completion: @escaping ([Product]) -> Void)
    func fetchSaved(completion: @escaping ([SavedProduct]) -> Void)

    
    var controller: CoordinatorDelegate { get }
    
    init(with productsManager: ProductsManagerProtocol, categoryManager: CategoryManagerProtocol, recentlyViewedManager: RecentlyViewedManagerProtocol, savedManager: SavedProductManagerProtocol, controller: CoordinatorDelegate)
}

final class HomeViewModel: HomeViewModelProtocol {
   private var productsManager: ProductsManagerProtocol!
   private var categoryManager: CategoryManagerProtocol!
    private var recentlyViewedManager: RecentlyViewedManagerProtocol!
    private var savedManager: SavedProductManagerProtocol!
    private(set) var controller: CoordinatorDelegate

   
    init(with productsManager: ProductsManagerProtocol, categoryManager: CategoryManagerProtocol, recentlyViewedManager: RecentlyViewedManagerProtocol, savedManager: SavedProductManagerProtocol, controller: CoordinatorDelegate) {
        self.productsManager = productsManager
        self.categoryManager = categoryManager
        self.recentlyViewedManager = recentlyViewedManager
        self.savedManager = savedManager
        self.controller = controller
    }
    
    func fetchCategory(completion: @escaping ([Product]) -> Void) {
        categoryManager.fetchCategory(completion: completion)
    }
    
    

    
    func fetchProducts(completion: @escaping ([Product]) -> Void) {
        productsManager.fetchProducts(completion: completion)
    }
    
    func fetchRecentlyViewed(completion: @escaping ([Product]) -> Void) {
        recentlyViewedManager.fetchRecentlyViewed(completion: completion)
    }
    
    func fetchSaved(completion: @escaping ([SavedProduct]) -> Void) {
        savedManager.fetchSaved(completion: completion)
    }

}
