//
//
//  MyTicketsPresenter.swift
//  VW-project
//
//  Created by venazp on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit

final class MyTicketsPresenter {

    // MARK: - Default properties -
    private weak var _view: MyTicketsViewInterface?
    private var _interactor: MyTicketsInteractorInterface
    private var _router: MyTicketsRouterInterface?

    // MARK: - Module Setup -
    init(_ interactor: MyTicketsInteractorInterface, _ router: MyTicketsRouterInterface) {
        _interactor = interactor
        _router = router
    }

    func set(_ view: MyTicketsViewInterface) {
        _view = view
    }

}

// MARK: - Extensions -
extension MyTicketsPresenter: MyTicketsPresenterInterface {
}
