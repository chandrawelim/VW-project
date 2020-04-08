//
//
//  TicketPresenter.swift
//  Ticket
//
//  Created by Chandra Welim on 08/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.

import UIKit

final class TicketPresenter {

    // MARK: - Default properties -
    private weak var _view: TicketViewInterface?
    private var _interactor: TicketInteractorInterface
    private var _router: TicketRouterInterface?

    // MARK: - Module Setup -
    init(interactor: TicketInteractorInterface, router: TicketRouterInterface) {
        _interactor = interactor
        _router = router
    }
}

// MARK: - Extensions -
extension TicketPresenter: TicketPresenterInterface {

    func setView(_ view: TicketViewInterface) {
        _view = view
    }
}
