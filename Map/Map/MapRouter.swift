//
//  MapRouter.swift
//  Map
//
//  Created by Chandra Welim on 08/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

final class MapRouter {

    // MARK: - Default properties -
    private weak var _view: MapViewController?
}

// MARK: - Extensions -
extension MapRouter: MapRouterInterface {

	func setView(_ view: MapViewController) {
    	_view = view    
    }

    func navigate(to option: MapNavigationOption) {
    }
}
