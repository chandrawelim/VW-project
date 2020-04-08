//
//  TicketInterfaces.swift
//  Ticket
//
//  Created by Chandra Welim on 08/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

enum TicketNavigationOption {
}

protocol TicketViewInterface: class {
}

protocol TicketInteractorInterface: class {
}

protocol TicketPresenterInterface: class {
	init(interactor: TicketInteractorInterface, router: TicketRouterInterface)
	func setView(_ view: TicketViewInterface)
}

protocol TicketRouterInterface: class {
    func navigate(to option: TicketNavigationOption)
    func setView(_ view: TicketViewController)
}