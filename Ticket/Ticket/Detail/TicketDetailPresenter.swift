//
//
//  TicketDetailPresenter.swift
//  Ticket
//
//  Created by Chandra Welim on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

final class TicketDetailPresenter {

    // MARK: - Default properties -
    private weak var _view: TicketDetailViewInterface?
    private var _interactor: TicketDetailInteractorInterface
    private var _router: TicketDetailRouterInterface?

    // MARK: - Module Setup -
    init(interactor: TicketDetailInteractorInterface, router: TicketDetailRouterInterface) {
        _interactor = interactor
        _router = router
    }
}

// MARK: - Extensions -
extension TicketDetailPresenter: TicketDetailPresenterInterface {

    func setView(_ view: TicketDetailViewInterface) {
        _view = view
    }
}
