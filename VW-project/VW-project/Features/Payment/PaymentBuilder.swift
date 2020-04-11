//
//  PaymentBuilder.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import Foundation
import UIKit

protocol PaymentBuilderInterface {
    func resolveView(presenter: PaymentPresenterInterface) -> PaymentViewController
    func resolveInteractor() -> PaymentInteractorInterface
    func resolvePresenter(interactor: PaymentInteractorInterface,
                          router: PaymentRouterInterface) -> PaymentPresenterInterface    
    func resolveRouter() -> PaymentRouterInterface
}

extension PaymentBuilderInterface {
    func resolveView(presenter: PaymentPresenterInterface) -> PaymentViewController {
       let _storyboard = UIStoryboard(name: "Payment", bundle: Bundle(for: PaymentBuilder.self))
        guard let view: PaymentViewController = _storyboard.instantiateInitialViewController(
            creator: { coder in
                PaymentViewController(coder: coder, presenter: presenter)
            }) else { fatalError("Initial Payment View Controller is not set") }
        return view
    }

    func resolveInteractor() -> PaymentInteractorInterface {
        return PaymentInteractor()
    }

    func resolvePresenter(interactor: PaymentInteractorInterface,
                          router: PaymentRouterInterface) -> PaymentPresenterInterface {
        return PaymentPresenter(interactor: interactor, router: router)
    }

    func resolveRouter() -> PaymentRouterInterface {
        return PaymentRouter()
    }
}

public class PaymentBuilder: PaymentBuilderInterface {

    public init() {}

    public func main() -> UIViewController {

        let interactor = resolveInteractor()
        let router = resolveRouter()
        let presenter = resolvePresenter(interactor: interactor,router: router)

        let view: PaymentViewController = resolveView(presenter: presenter)
        presenter.setView(view)
        router.setView(view)
        return view
    }
}
