//
//
//  MapPresenter.swift
//  VW-project
//
//  Created by venazp on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit

final class MapPresenter {

    // MARK: - Default properties -
    private weak var _view: MapViewInterface?
    private var _interactor: MapInteractorInterface
    private var _router: MapRouterInterface?

    // MARK: - Module Setup -
    init(_ interactor: MapInteractorInterface, _ router: MapRouterInterface) {
        _interactor = interactor
        _router = router
    }

    func set(_ view: MapViewInterface) {
        _view = view
    }

}

// MARK: - Extensions -
extension MapPresenter: MapPresenterInterface {
}
