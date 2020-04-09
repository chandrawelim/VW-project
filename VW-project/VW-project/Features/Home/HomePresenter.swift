//
//
//  HomePresenter.swift
//  VW-project
//
//  Created by venazp on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit

final class HomePresenter {

    // MARK: - Default properties -
    private weak var _view: HomeViewInterface?
    private var _interactor: HomeInteractorInterface
    private var _router: HomeRouterInterface?

    // MARK: - Module Setup -
    init(_ interactor: HomeInteractorInterface, _ router: HomeRouterInterface) {
        _interactor = interactor
        _router = router
    }

    func set(_ view: HomeViewInterface) {
        _view = view
    }

}

// MARK: - Extensions -
extension HomePresenter: HomePresenterInterface {
}
