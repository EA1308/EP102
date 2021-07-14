//
//  RecentlyViewedManager.swift
//  EbayApp
//
//  Created by MacBook  on 14.07.21.
//

import Foundation
protocol RecentlyViewedManagerProtocol: AnyObject {
    func fetchRecentlyViewed(completion: @escaping ([Product]) -> Void)
}

 class RecentlyViewedManager: RecentlyViewedManagerProtocol {
    func fetchRecentlyViewed(completion: @escaping ([Product]) -> Void) {
        let url = "https://run.mocky.io/v3/128ee9b1-c6b2-4815-b78c-b07a8956c936?fbclid=IwAR2IcaM-nAmFdvw_abyJevW86RFGFLv-iKNCfxYCRPHiFe--4xlDoUZnKqc"
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
