//
//  ProductsManager.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import Foundation

protocol ProductsManagerProtocol: AnyObject {
    func fetchProducts(completion: @escaping ([Product]) -> Void)
}

 class ProductManager: ProductsManagerProtocol {
    func fetchProducts(completion: @escaping ([Product]) -> Void) {
        let url = "https://fakestoreapi.com/products"
        NetworkManager.shared.get(url: url) { (result: Result<[Product], Error>) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    completion(response)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
