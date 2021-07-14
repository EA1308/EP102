//
//  CartCoordinator.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import UIKit


final class CartCoordinator: CoordinatorProtocol {
    
  
    var navigationController: UINavigationController?

    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
        self.navigationController?.isNavigationBarHidden = true
        
        let vc = CartViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.tabBarItem.image = UIImage(named: "ic_cart")
        vc.title = "Cart"
        
        self.navigationController?.viewControllers = [vc]
    
    }
    
}
