//
//  NewTrendViewModel.swift
//  EbayApp
//
//  Created by MacBook  on 14.07.21.
//

import Foundation

protocol NewTrendViewModelProtocol {
    func fetchProducts(completion: @escaping ([Product]) -> Void)
    init(with productsManager: ProductsManagerProtocol)
}

class NewTrendViewModel: NewTrendViewModelProtocol {
    
    private var productManager: ProductsManagerProtocol!
    
    required init(with productsManager: ProductsManagerProtocol) {
        self.productManager = productsManager
    }
    

    
    func fetchProducts(completion: @escaping ([Product]) -> Void) {
        productManager.fetchProducts(completion: completion)
    }
    
}
