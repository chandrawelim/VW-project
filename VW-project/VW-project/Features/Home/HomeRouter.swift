//
//  HomeRouter.swift
//  VW-project
//
//  Created by venazp on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit

final class HomeRouter {

    // MARK: - Default properties -
    private weak var _view: HomeViewController?

    // MARK: - Module Setup -
    func set(_ view: HomeViewController) {
        _view = view
    }

}

// MARK: - Extensions -
extension HomeRouter: HomeRouterInterface {

    func navigate(to option: HomeNavigationOption) {
    }
}
