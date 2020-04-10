//
//  PaymentRouter.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

final class PaymentRouter {

    // MARK: - Default properties -
    private weak var _view: PaymentViewController?
}

// MARK: - Extensions -
extension PaymentRouter: PaymentRouterInterface {

	func setView(_ view: PaymentViewController) {
    	_view = view    
    }

    func navigate(to option: PaymentNavigationOption) {
    }
}
