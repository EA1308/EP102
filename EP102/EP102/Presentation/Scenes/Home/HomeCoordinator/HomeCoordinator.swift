//
//  HomeCoordinator.swift
//  BookStoreApp
//
//  Created by MacBook  on 12.07.21.
//

import UIKit

final class HomeCoordinator: CoordinatorProtocol {
    
  
    var navigationController: UINavigationController?

    init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
        self.navigationController = navigationController
        
        let vc = HomeViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.tabBarItem.image = UIImage(named: "ic_home")
//        vc.title = "Home"
        vc.title = ""
        self.navigationController?.navigationBar.topItem?.title = ""

        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.viewControllers = [vc]
    
    }
    
    func start() {
        
    }
    
    func proceedToDetails() {
        let vc = NewTrendViewController.instantiateFromStoryboard()
        vc.coordinator = self
        vc.title = "New Trend"
        navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.navigationController?.navigationBar.tintColor = UIColor.black
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
