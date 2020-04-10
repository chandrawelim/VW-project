//
//  BookTicketsInterfaces.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

enum BookTicketsNavigationOption {
}

protocol BookTicketsViewInterface: class {
}

protocol BookTicketsInteractorInterface: class {
}

protocol BookTicketsPresenterInterface: class {
	init(interactor: BookTicketsInteractorInterface, router: BookTicketsRouterInterface)
	func setView(_ view: BookTicketsViewInterface)
}

protocol BookTicketsRouterInterface: class {
    func navigate(to option: BookTicketsNavigationOption)
    func setView(_ view: BookTicketsViewController)
}