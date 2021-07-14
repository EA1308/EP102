//
//  SearchCoordinator.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import UIKit


final class SearchCoordinator: CoordinatorProtocol {

    var navigationController: UINavigationController?

    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
        self.navigationController?.isNavigationBarHidden = true
        
        let vc = SearchViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.tabBarItem.image = UIImage(named: "ic_search")
        vc.title = "Search"
        
        self.navigationController?.viewControllers = [vc]
    
    }

}
