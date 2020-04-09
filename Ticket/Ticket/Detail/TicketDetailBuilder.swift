//
//  TicketDetailBuilder.swift
//  Ticket
//
//  Created by Chandra Welim on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import Foundation
import UIKit

protocol TicketDetailBuilderInterface {
    func resolveView(presenter: TicketDetailPresenterInterface) -> TicketDetailViewController
    func resolveInteractor() -> TicketDetailInteractorInterface
    func resolvePresenter(interactor: TicketDetailInteractorInterface,
                          router: TicketDetailRouterInterface) -> TicketDetailPresenterInterface    
    func resolveRouter() -> TicketDetailRouterInterface
}

extension TicketDetailBuilderInterface {
    func resolveView(presenter: TicketDetailPresenterInterface) -> TicketDetailViewController {
        let _storyboard = UIStoryboard(name: "TicketDetail", bundle: Bundle(for: TicketDetailBuilder.self))
        guard let view: TicketDetailViewController = _storyboard.instantiateInitialViewController(
            creator: { coder in
                TicketDetailViewController(coder: coder)
        }) else { fatalError("Initial View Controller is not set up") }
        view.set(presenter: presenter)
        return view
    }
    
    func resolveInteractor() -> TicketDetailInteractorInterface {
        return TicketDetailInteractor()
    }
    
    func resolvePresenter(interactor: TicketDetailInteractorInterface,
                          router: TicketDetailRouterInterface) -> TicketDetailPresenterInterface {
        return TicketDetailPresenter(interactor: interactor, router: router)
    }
    
    func resolveRouter() -> TicketDetailRouterInterface {
        return TicketDetailRouter()
    }
}

public class TicketDetailBuilder: TicketDetailBuilderInterface {
    
    public init() {}
    
    public func main() -> UIViewController {
        
        let interactor = resolveInteractor()
        let router = resolveRouter()
        let presenter = resolvePresenter(interactor: interactor,router: router)
        
        let view: TicketDetailViewController = resolveView(presenter: presenter)
        presenter.setView(view)
        router.setView(view)
        return view
    }
}
