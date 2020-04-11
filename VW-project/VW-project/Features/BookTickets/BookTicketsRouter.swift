//
//  BookTicketsRouter.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

final class BookTicketsRouter {

    // MARK: - Default properties -
    private weak var _view: BookTicketsViewController?
}

// MARK: - Extensions -
extension BookTicketsRouter: BookTicketsRouterInterface {

    func setView(_ view: BookTicketsViewController) {
        _view = view
    }
    
    func navigate(to option: BookTicketsNavigationOption) {
        switch option {
        case .checkout:
            let vc = CheckoutBuilder().main()
            _view?.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
