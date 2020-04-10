//
//
//  CheckoutPresenter.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

final class CheckoutPresenter {

    // MARK: - Default properties -
    private weak var _view: CheckoutViewInterface?
    private var _interactor: CheckoutInteractorInterface
    private var _router: CheckoutRouterInterface?

    // MARK: - Module Setup -
    init(interactor: CheckoutInteractorInterface, router: CheckoutRouterInterface) {
        _interactor = interactor
        _router = router
    }
}

// MARK: - Extensions -
extension CheckoutPresenter: CheckoutPresenterInterface {

    func setView(_ view: CheckoutViewInterface) {
        _view = view
    }
}
