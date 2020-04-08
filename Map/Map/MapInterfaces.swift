//
//  MapInterfaces.swift
//  Map
//
//  Created by Chandra Welim on 08/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

enum MapNavigationOption {
}

protocol MapViewInterface: class {
}

protocol MapInteractorInterface: class {
}

protocol MapPresenterInterface: class {
	init(interactor: MapInteractorInterface, router: MapRouterInterface)
	func setView(_ view: MapViewInterface)
}

protocol MapRouterInterface: class {
    func navigate(to option: MapNavigationOption)
    func setView(_ view: MapViewController)
}