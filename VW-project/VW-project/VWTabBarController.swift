//
//  VWTabBarController.swift
//  VW-project
//
//  Created by Chandra Welim on 08/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class VWTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [ticketNav(), mapNav(), profileVC()]
    }
    
    func ticketNav() -> UINavigationController {
        let ticketVC = ViewController()
        ticketVC.title = "Search"
        ticketVC.tabBarItem = UITabBarItem(title: "Search", image: nil, tag: 0)
        return UINavigationController(rootViewController: ticketVC)
    }
    
    func mapNav() -> UINavigationController {
        let mapVC = ViewController()
        mapVC.title = "Map"
        mapVC.tabBarItem = UITabBarItem(title: "Map", image: nil, tag: 0)
        return UINavigationController(rootViewController: mapVC)
    }
    
    func profileVC() -> UINavigationController {
        let profileVC = ViewController()
        profileVC.title = "Profile"
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: nil, tag: 0)
        return UINavigationController(rootViewController: profileVC)
    }
}

