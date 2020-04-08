//
//  ProfileRouter.swift
//  Profile
//
//  Created by Chandra Welim on 08/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.

import UIKit

final class ProfileRouter {

    // MARK: - Default properties -
    private weak var _view: ProfileViewController?
}

// MARK: - Extensions -
extension ProfileRouter: ProfileRouterInterface {

	func setView(_ view: ProfileViewController) {
    	_view = view    
    }

    func navigate(to option: ProfileNavigationOption) {
    }
}
