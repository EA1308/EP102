//
//  SavedProductManager.swift
//  EbayApp
//
//  Created by MacBook  on 14.07.21.
//

import Foundation

protocol SavedProductManagerProtocol: AnyObject {
    func fetchSaved(completion: @escaping ([SavedProduct]) -> Void)
}

 class SavedProductManager: SavedProductManagerProtocol {
    func fetchSaved(completion: @escaping ([SavedProduct]) -> Void) {
        let url = "https://run.mocky.io/v3/3b06cd4c-0486-4758-9446-ca66bdb04c72?fbclid=IwAR1f1bDbryKi5ow54_i3T5_hc2TYcz3BiQTs5v9zBYmjKtTpaIFKZpFX-LA"
        NetworkManager.shared.get(url: url) { (result: Result<[SavedProduct], Error>) in
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



