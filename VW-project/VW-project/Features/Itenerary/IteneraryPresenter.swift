//
//
//  IteneraryPresenter.swift
//  VW-project
//
//  Created by venazp on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit

final class IteneraryPresenter {

    // MARK: - Default properties -
    private weak var _view: IteneraryViewInterface?
    private var _interactor: IteneraryInteractorInterface
    private var _router: IteneraryRouterInterface?

    // MARK: - Module Setup -
    init(_ interactor: IteneraryInteractorInterface, _ router: IteneraryRouterInterface) {
        _interactor = interactor
        _router = router
    }

    func set(_ view: IteneraryViewInterface) {
        _view = view
    }

}

// MARK: - Extensions -
extension IteneraryPresenter: IteneraryPresenterInterface {
}
