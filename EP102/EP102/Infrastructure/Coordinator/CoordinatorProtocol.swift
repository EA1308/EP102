//
//  BaseViewController.swift
//  BookStoreApp
//
//  Created by MacBook  on 12.07.21.
//


import UIKit

protocol CoordinatorProtocol: AnyObject {

    init(_ window: UIWindow?, navigationController: UINavigationController?)
    
    func start()
    func proceedToDetails()
 
}

extension CoordinatorProtocol {
    func proceedToDetails() {}
  
}
