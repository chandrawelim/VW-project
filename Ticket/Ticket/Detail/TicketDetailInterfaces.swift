//
//  TicketDetailInterfaces.swift
//  Ticket
//
//  Created by Chandra Welim on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

enum TicketDetailNavigationOption {
}

protocol TicketDetailViewInterface: class {
}

protocol TicketDetailInteractorInterface: class {
}

protocol TicketDetailPresenterInterface: class {
	init(interactor: TicketDetailInteractorInterface, router: TicketDetailRouterInterface)
	func setView(_ view: TicketDetailViewInterface)
}

protocol TicketDetailRouterInterface: class {
    func navigate(to option: TicketDetailNavigationOption)
    func setView(_ view: TicketDetailViewController)
}