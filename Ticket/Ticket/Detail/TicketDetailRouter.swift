//
//  TicketDetailRouter.swift
//  Ticket
//
//  Created by Chandra Welim on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

final class TicketDetailRouter {

    // MARK: - Default properties -
    private weak var _view: TicketDetailViewController?
}

// MARK: - Extensions -
extension TicketDetailRouter: TicketDetailRouterInterface {

	func setView(_ view: TicketDetailViewController) {
    	_view = view    
    }

    func navigate(to option: TicketDetailNavigationOption) {
    }
}
