//
//
//  BookTicketsPresenter.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

final class BookTicketsPresenter {

    // MARK: - Default properties -
    private weak var _view: BookTicketsViewInterface?
    private var _interactor: BookTicketsInteractorInterface
    private var _router: BookTicketsRouterInterface?

    // MARK: - Module Setup -
    init(interactor: BookTicketsInteractorInterface, router: BookTicketsRouterInterface) {
        _interactor = interactor
        _router = router
    }
}

// MARK: - Extensions -
extension BookTicketsPresenter: BookTicketsPresenterInterface {

    func setView(_ view: BookTicketsViewInterface) {
        _view = view
    }
}
