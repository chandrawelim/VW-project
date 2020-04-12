//
//
//  SuccessPagePresenter.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

final class SuccessPagePresenter {

    // MARK: - Default properties -
    private weak var _view: SuccessPageViewInterface?
    private var _interactor: SuccessPageInteractorInterface
    private var _router: SuccessPageRouterInterface?

    // MARK: - Module Setup -
    init(interactor: SuccessPageInteractorInterface, router: SuccessPageRouterInterface) {
        _interactor = interactor
        _router = router
    }
}

// MARK: - Extensions -
extension SuccessPagePresenter: SuccessPagePresenterInterface {

    func setView(_ view: SuccessPageViewInterface) {
        _view = view
    }
}
