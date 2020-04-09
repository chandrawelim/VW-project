//
//  MapInterfaces.swift
//  VW-project
//
//  Created by venazp on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit

enum MapNavigationOption {
}

protocol MapRouterInterface: class {
    func set(_ view: MapViewController)
    func navigate(to option: MapNavigationOption)
}

protocol MapViewInterface: class {
}

protocol MapPresenterInterface: class {
    init(_ interactor: MapInteractorInterface, _ router: MapRouterInterface)
    func set(_ view: MapViewInterface)
}

protocol MapInteractorInterface: class {
}
