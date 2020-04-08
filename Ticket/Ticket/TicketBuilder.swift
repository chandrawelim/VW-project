//
//  TicketBuilder.swift
//  Ticket
//
//  Created by Chandra Welim on 08/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import Foundation
import UIKit

protocol TicketBuilderInterface {
    func resolveView(presenter: TicketPresenterInterface) -> TicketViewController
    func resolveInteractor() -> TicketInteractorInterface
    func resolvePresenter(interactor: TicketInteractorInterface,
                          router: TicketRouterInterface) -> TicketPresenterInterface    
    func resolveRouter() -> TicketRouterInterface
}

extension TicketBuilderInterface {
    func resolveView(presenter: TicketPresenterInterface) -> TicketViewController {
        let _storyboard = UIStoryboard(name: "Ticket", bundle: Bundle(for: TicketBuilder.self))
        guard let view: TicketViewController = _storyboard.instantiateInitialViewController(
            creator: { coder in
                TicketViewController(coder: coder)
            }) else { fatalError("Initial View Controller is not set up") }
        view.set(presenter: presenter)
        return view
    }

    func resolveInteractor() -> TicketInteractorInterface {
        return TicketInteractor()
    }

    func resolvePresenter(interactor: TicketInteractorInterface,
                          router: TicketRouterInterface) -> TicketPresenterInterface {
        return TicketPresenter(interactor: interactor, router: router)
    }

    func resolveRouter() -> TicketRouterInterface {
        return TicketRouter()
    }
}

public class TicketBuilder: TicketBuilderInterface {

    public init() {}

    public func main() -> UIViewController {

        let interactor = resolveInteractor()
        let router = resolveRouter()
        let presenter = resolvePresenter(interactor: interactor,router: router)

        let view: TicketViewController = resolveView(presenter: presenter)
        presenter.setView(view)
        router.setView(view)
        return view
    }
}
