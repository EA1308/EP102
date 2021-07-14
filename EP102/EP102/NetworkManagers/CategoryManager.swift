//
//  CategoryManager.swift
//  EbayApp
//
//  Created by MacBook  on 14.07.21.
//

import Foundation

protocol CategoryManagerProtocol: AnyObject {
    func fetchCategory(completion: @escaping ([Product]) -> Void)
}

 class CategoryManager: CategoryManagerProtocol {
    func fetchCategory(completion: @escaping ([Product]) -> Void) {
        let url = "https://run.mocky.io/v3/9ef77129-0d86-4023-b1e7-64571f1c8a4b?fbclid=IwAR0tKIdfdlMJOIy9h2HYyrEZljSES9sma-s_aU8t4XjIzIfCck2jU6AA3qY"
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
