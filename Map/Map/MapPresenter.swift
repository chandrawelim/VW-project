//
//
//  MapPresenter.swift
//  Map
//
//  Created by Chandra Welim on 08/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

final class MapPresenter {

    // MARK: - Default properties -
    private weak var _view: MapViewInterface?
    private var _interactor: MapInteractorInterface
    private var _router: MapRouterInterface?

    // MARK: - Module Setup -
    init(interactor: MapInteractorInterface, router: MapRouterInterface) {
        _interactor = interactor
        _router = router
    }
}

// MARK: - Extensions -
extension MapPresenter: MapPresenterInterface {

    func setView(_ view: MapViewInterface) {
        _view = view
    }
}
