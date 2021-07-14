//
//  Product.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import Foundation

struct Product: Codable {
    let id: Int?
    let title: String?
    let price: Double?
    let description: String?
    let category: String?
    let image: String?    
}

