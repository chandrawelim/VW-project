//
//  MyTicketsRouter.swift
//  VW-project
//
//  Created by venazp on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit

final class MyTicketsRouter {

    // MARK: - Default properties -
    private weak var _view: MyTicketsViewController?

    // MARK: - Module Setup -
    func set(_ view: MyTicketsViewController) {
        _view = view
    }

}

// MARK: - Extensions -
extension MyTicketsRouter: MyTicketsRouterInterface {

    func navigate(to option: MyTicketsNavigationOption) {
    }
}
