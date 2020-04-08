//
//
//  ProfilePresenter.swift
//  Profile
//
//  Created by Chandra Welim on 08/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.

import UIKit

final class ProfilePresenter {

    // MARK: - Default properties -
    private weak var _view: ProfileViewInterface?
    private var _interactor: ProfileInteractorInterface
    private var _router: ProfileRouterInterface?

    // MARK: - Module Setup -
    init(interactor: ProfileInteractorInterface, router: ProfileRouterInterface) {
        _interactor = interactor
        _router = router
    }
}

// MARK: - Extensions -
extension ProfilePresenter: ProfilePresenterInterface {

    func setView(_ view: ProfileViewInterface) {
        _view = view
    }
}
