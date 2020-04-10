//
//  CheckoutInterfaces.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

enum CheckoutNavigationOption {
}

protocol CheckoutViewInterface: class {
}

protocol CheckoutInteractorInterface: class {
}

protocol CheckoutPresenterInterface: class {
	init(interactor: CheckoutInteractorInterface, router: CheckoutRouterInterface)
	func setView(_ view: CheckoutViewInterface)
}

protocol CheckoutRouterInterface: class {
    func navigate(to option: CheckoutNavigationOption)
    func setView(_ view: CheckoutViewController)
}