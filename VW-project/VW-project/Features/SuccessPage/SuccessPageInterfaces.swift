//
//  SuccessPageInterfaces.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

enum SuccessPageNavigationOption {
}

protocol SuccessPageViewInterface: class {
}

protocol SuccessPageInteractorInterface: class {
}

protocol SuccessPagePresenterInterface: class {
	init(interactor: SuccessPageInteractorInterface, router: SuccessPageRouterInterface)
	func setView(_ view: SuccessPageViewInterface)
}

protocol SuccessPageRouterInterface: class {
    func navigate(to option: SuccessPageNavigationOption)
    func setView(_ view: SuccessPageViewController)
}