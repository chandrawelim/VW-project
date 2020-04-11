//
//  CheckoutBuilder.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import Foundation
import UIKit

protocol CheckoutBuilderInterface {
    func resolveView(presenter: CheckoutPresenterInterface) -> CheckoutViewController
    func resolveInteractor() -> CheckoutInteractorInterface
    func resolvePresenter(interactor: CheckoutInteractorInterface,
                          router: CheckoutRouterInterface) -> CheckoutPresenterInterface    
    func resolveRouter() -> CheckoutRouterInterface
}

extension CheckoutBuilderInterface {
    func resolveView(presenter: CheckoutPresenterInterface) -> CheckoutViewController {
       let _storyboard = UIStoryboard(name: "Checkout", bundle: Bundle(for: CheckoutBuilder.self))
        guard let view: CheckoutViewController = _storyboard.instantiateInitialViewController(
            creator: { coder in
                CheckoutViewController(coder: coder, presenter: presenter)
            }) else { fatalError("Initial Checkout View Controller is not set") }
        return view
    }

    func resolveInteractor() -> CheckoutInteractorInterface {
        return CheckoutInteractor()
    }

    func resolvePresenter(interactor: CheckoutInteractorInterface,
                          router: CheckoutRouterInterface) -> CheckoutPresenterInterface {
        return CheckoutPresenter(interactor: interactor, router: router)
    }

    func resolveRouter() -> CheckoutRouterInterface {
        return CheckoutRouter()
    }
}

public class CheckoutBuilder: CheckoutBuilderInterface {

    public init() {}

    public func main() -> UIViewController {

        let interactor = resolveInteractor()
        let router = resolveRouter()
        let presenter = resolvePresenter(interactor: interactor,router: router)

        let view: CheckoutViewController = resolveView(presenter: presenter)
        presenter.setView(view)
        router.setView(view)
        return view
    }
}
