//
//  BaseTabBarController.swift
//  AppStoreClone
//
//  Created by mac on 12/08/2021.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let redController = UIViewController()
        redController.view.backgroundColor = .systemRed
        redController.navigationItem.title = "Home"
        
        let redNavController = UINavigationController(rootViewController: redController)
        redNavController.tabBarItem.title = "NavHome"
        redNavController.tabBarItem.image = UIImage(named: "apps")
        redNavController.navigationBar.prefersLargeTitles = true
        
        let blueController = UIViewController()
        blueController.view.backgroundColor = .cyan
        blueController.navigationItem.title = "Search"
        
        let blueNavController = UINavigationController(rootViewController: blueController)
        blueNavController.tabBarItem.title = "NavBlue"
        redNavController.tabBarItem.image = UIImage(named: "search")
        blueNavController.navigationBar.prefersLargeTitles = true
        
        viewControllers = [
            redNavController,
            blueNavController
        ]
    }
}
