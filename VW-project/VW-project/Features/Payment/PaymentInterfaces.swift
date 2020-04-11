//
//  PaymentInterfaces.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

enum PaymentNavigationOption {
    case successPage
}

protocol PaymentViewInterface: class {
}

protocol PaymentInteractorInterface: class {
}

protocol PaymentPresenterInterface: class {
	init(interactor: PaymentInteractorInterface, router: PaymentRouterInterface)
	func setView(_ view: PaymentViewInterface)
    func openNextScreen()
}

protocol PaymentRouterInterface: class {
    func navigate(to option: PaymentNavigationOption)
    func setView(_ view: PaymentViewController)
}
