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
        setTabbar()
        
        viewControllers = [home(), map(), itenerary(), myTickets()]

    }
    
    private func setTabbar() {
        tabBar.barTintColor = .white
        tabBar.layer.masksToBounds = true
        tabBar.isTranslucent = true
        tabBar.barStyle = .black
        tabBar.tintColor = .black
        tabBar.layer.cornerRadius = 16
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        UITabBarItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.font: UIFont.monseratBold(10)], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.font: UIFont.monseratBold(10)], for: .normal)

    }
    
    func home() -> UINavigationController {
        let homeVC = HomeBuilder().main()
        homeVC.title = "Home"
        homeVC.tabBarItem = UITabBarItem(title: "HOME", image: #imageLiteral(resourceName: "home_ico-inactive"), tag: 0)
        homeVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "home_ico-active")
        return UINavigationController(rootViewController: homeVC)
    }
    
    func map() -> UINavigationController {
        let mapVC = MapBuilder().main()
        mapVC.title = "Map"
        mapVC.tabBarItem = UITabBarItem(title: "MAP", image: #imageLiteral(resourceName: "map_ico-inactive"), tag: 0)
        mapVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "map_ico-active")
        return UINavigationController(rootViewController: mapVC)
    }
    
    func itenerary() -> UINavigationController {
        let iteneraryVC = IteneraryBuilder().main()
        iteneraryVC.title = "Itenerary"
        iteneraryVC.tabBarItem = UITabBarItem(title: "ITENERARY", image: #imageLiteral(resourceName: "itenerary_ico-inactive"), tag: 0)
        iteneraryVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "itenerary_ico-active")
        return UINavigationController(rootViewController: iteneraryVC)
    }
    
    func myTickets() -> UINavigationController {
        let myTicketVC = MyTicketsBuilder().main()
        myTicketVC.title = "My Tickets"
        myTicketVC.tabBarItem = UITabBarItem(title: "MY TICKETS", image: #imageLiteral(resourceName: "ticket_ico-inactive"), tag: 0)
        myTicketVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "ticket_ico-active")
        return UINavigationController(rootViewController: myTicketVC)
    }

}

