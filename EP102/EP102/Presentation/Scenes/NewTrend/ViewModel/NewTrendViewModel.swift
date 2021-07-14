//
//  NewTrendViewModel.swift
//  EbayApp
//
//  Created by MacBook  on 14.07.21.
//

import Foundation

protocol NewTrendViewModelProtocol {
    func fetchProducts(completion: @escaping ([Product]) -> Void)
    var controller: CoordinatorDelegate { get }

    init(with productsManager: ProductsManagerProtocol, controller: CoordinatorDelegate)
}

class NewTrendViewModel: NewTrendViewModelProtocol {
            
    private var productManager: ProductsManagerProtocol!
    private(set) var controller: CoordinatorDelegate
    
    required init(with productsManager: ProductsManagerProtocol, controller: CoordinatorDelegate) {
        self.productManager = productsManager
        self.controller = controller
    }
    

    
    func fetchProducts(completion: @escaping ([Product]) -> Void) {
        productManager.fetchProducts(completion: completion)
    }
    
}
