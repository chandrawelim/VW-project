//
//  MapRouter.swift
//  VW-project
//
//  Created by venazp on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit

final class MapRouter {

    // MARK: - Default properties -
    private weak var _view: MapViewController?

    // MARK: - Module Setup -
    func set(_ view: MapViewController) {
        _view = view
    }

}

// MARK: - Extensions -
extension MapRouter: MapRouterInterface {

    func navigate(to option: MapNavigationOption) {
    }
}
