//
//  BookTicketsInterfaces.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

enum BookTicketsNavigationOption {
    case checkout
}

protocol BookTicketsViewInterface: class {
    func showTicketPass()
}

protocol BookTicketsInteractorInterface: class {
}

protocol BookTicketsPresenterInterface: class {
	init(interactor: BookTicketsInteractorInterface, router: BookTicketsRouterInterface)
	func setView(_ view: BookTicketsViewInterface)
    func viewDidLoad()
    func numberOfRows() -> Int
    func getTicketPass(atIndex index: Int) -> TicketPass
    func didSelectTicketPass(atIndex index: Int)
    func openNextScreen()
}

protocol BookTicketsRouterInterface: class {
    func navigate(to option: BookTicketsNavigationOption)
    func setView(_ view: BookTicketsViewController)
}
