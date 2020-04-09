//
//  VWTabBarController.swift
//  VW-project
//
//  Created by Chandra Welim on 08/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit
import Profile
import Ticket
import Map

class VWTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UITabBar.appearance().tintColor = .systemGreen
        viewControllers = [home(), map(), itenerary(), myTickets()]
    }
    
    func home() -> UINavigationController {
        let ticketVC = TicketBuilder().main()
        ticketVC.title = "Home"
        ticketVC.tabBarItem = UITabBarItem(title: "Ticket", image: nil, tag: 0)
        return UINavigationController(rootViewController: ticketVC)
    }
    
    func map() -> UINavigationController {
        let mapVC = MapBuilder().main()
        mapVC.title = "Map"
        mapVC.tabBarItem = UITabBarItem(title: "Map", image: nil, tag: 0)
        return UINavigationController(rootViewController: mapVC)
    }
    
    func itenerary() -> UINavigationController {
        let profileVC = ProfileBuilder().main()
        profileVC.title = "Itenerary"
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: nil, tag: 0)
        return UINavigationController(rootViewController: profileVC)
    }
    
    func myTickets() -> UINavigationController {
        let profileVC = ProfileBuilder().main()
        profileVC.title = "My Tickets"
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: nil, tag: 0)
        return UINavigationController(rootViewController: UIViewController())
    }

}

