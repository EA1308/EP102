//
//  File.swift
//  EP102
//
//  Created by MacBook  on 14.07.21.
//

import Foundation


protocol BrandManagerProtocol: AnyObject {
    func fetchBrands(completion: @escaping ([Brand]) -> Void)
}

 class BrandManager: BrandManagerProtocol {
    func fetchBrands(completion: @escaping ([Brand]) -> Void) {
        let url = "https://run.mocky.io/v3/4360e4a1-8f87-4bb0-9bfc-fa381e4cc822?fbclid=IwAR2SVtTraRjbCo1DNd4aJhBiov-yuQ-5eempbzNixKbDGXyTnqsGkCs99VQ"
        NetworkManager.shared.get(url: url) { (result: Result<[Brand], Error>) in
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
