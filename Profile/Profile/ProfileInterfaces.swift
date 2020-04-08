//
//  ProfileInterfaces.swift
//  Profile
//
//  Created by Chandra Welim on 08/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

enum ProfileNavigationOption {
}

protocol ProfileViewInterface: class {
}

protocol ProfileInteractorInterface: class {
}

protocol ProfilePresenterInterface: class {
	init(interactor: ProfileInteractorInterface, router: ProfileRouterInterface)
	func setView(_ view: ProfileViewInterface)
}

protocol ProfileRouterInterface: class {
    func navigate(to option: ProfileNavigationOption)
    func setView(_ view: ProfileViewController)
}