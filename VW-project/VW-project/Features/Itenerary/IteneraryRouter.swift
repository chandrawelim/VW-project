//
//  IteneraryRouter.swift
//  VW-project
//
//  Created by venazp on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit

final class IteneraryRouter {

    // MARK: - Default properties -
    private weak var _view: IteneraryViewController?

    // MARK: - Module Setup -
    func set(_ view: IteneraryViewController) {
        _view = view
    }

}

// MARK: - Extensions -
extension IteneraryRouter: IteneraryRouterInterface {

    func navigate(to option: IteneraryNavigationOption) {
    }
}
