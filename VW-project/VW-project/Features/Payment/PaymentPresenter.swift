//
//
//  PaymentPresenter.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

final class PaymentPresenter {

    // MARK: - Default properties -
    private weak var _view: PaymentViewInterface?
    private var _interactor: PaymentInteractorInterface
    private var _router: PaymentRouterInterface?

    // MARK: - Module Setup -
    init(interactor: PaymentInteractorInterface, router: PaymentRouterInterface) {
        _interactor = interactor
        _router = router
    }
}

// MARK: - Extensions -
extension PaymentPresenter: PaymentPresenterInterface {

    func setView(_ view: PaymentViewInterface) {
        _view = view
    }
}
