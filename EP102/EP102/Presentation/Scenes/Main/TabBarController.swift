//
//  TabBarController.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import UIKit

class TabBarController: UITabBarController, Storyboarded, CoordinatorDelegate {
    var coordinator: CoordinatorProtocol?
    
    private var homeCoordinator = HomeCoordinator()
    private var searchCoordinator = SearchCoordinator()
    private var cartCoordinator = CartCoordinator()
    private var savedCoordinator = SavedCoordinator()
    private var profileCoordinator = ProfileCoordinator()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = UIColor(hex: "8F5F43")

        viewControllers = [
            homeCoordinator.navigationController!,
            searchCoordinator.navigationController!,
            cartCoordinator.navigationController!,
            savedCoordinator.navigationController!,
            profileCoordinator.navigationController!
        ]
    }
    

}
