//
//  CheckoutRouter.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

final class CheckoutRouter {

    // MARK: - Default properties -
    private weak var _view: CheckoutViewController?
}

// MARK: - Extensions -
extension CheckoutRouter: CheckoutRouterInterface {

	func setView(_ view: CheckoutViewController) {
    	_view = view    
    }

    func navigate(to option: CheckoutNavigationOption) {
        switch option {
        case .payment:
            let vc = PaymentBuilder().main()
            _view?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
