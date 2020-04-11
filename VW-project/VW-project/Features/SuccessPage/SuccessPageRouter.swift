//
//  SuccessPageRouter.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

final class SuccessPageRouter {

    // MARK: - Default properties -
    private weak var _view: SuccessPageViewController?
}

// MARK: - Extensions -
extension SuccessPageRouter: SuccessPageRouterInterface {

	func setView(_ view: SuccessPageViewController) {
    	_view = view    
    }

    func navigate(to option: SuccessPageNavigationOption) {
    }
}
