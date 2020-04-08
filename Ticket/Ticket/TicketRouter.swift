//
//  TicketRouter.swift
//  Ticket
//
//  Created by Chandra Welim on 08/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

final class TicketRouter {

    // MARK: - Default properties -
    private weak var _view: TicketViewController?
}

// MARK: - Extensions -
extension TicketRouter: TicketRouterInterface {

	func setView(_ view: TicketViewController) {
    	_view = view    
    }

    func navigate(to option: TicketNavigationOption) {
    }
}
