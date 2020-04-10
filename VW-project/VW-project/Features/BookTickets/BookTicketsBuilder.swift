//
//  BookTicketsBuilder.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import Foundation
import UIKit

protocol BookTicketsBuilderInterface {
    func resolveView(presenter: BookTicketsPresenterInterface) -> BookTicketsViewController
    func resolveInteractor() -> BookTicketsInteractorInterface
    func resolvePresenter(interactor: BookTicketsInteractorInterface,
                          router: BookTicketsRouterInterface) -> BookTicketsPresenterInterface    
    func resolveRouter() -> BookTicketsRouterInterface
}

extension BookTicketsBuilderInterface {
    func resolveView(presenter: BookTicketsPresenterInterface) -> BookTicketsViewController {
        let _storyboard = UIStoryboard(name: "BookTickets", bundle: Bundle(for: BookTicketsBuilder.self))
        guard let view: BookTicketsViewController = _storyboard.instantiateInitialViewController(
            creator: { coder in
                BookTicketsViewController(coder: coder, presenter: presenter)
        }) else { fatalError("Initial BookTickets View Controller is not set") }
        return view
    }
    
    func resolveInteractor() -> BookTicketsInteractorInterface {
        return BookTicketsInteractor()
    }
    
    func resolvePresenter(interactor: BookTicketsInteractorInterface,
                          router: BookTicketsRouterInterface) -> BookTicketsPresenterInterface {
        return BookTicketsPresenter(interactor: interactor, router: router)
    }
    
    func resolveRouter() -> BookTicketsRouterInterface {
        return BookTicketsRouter()
    }
    
    func main() -> UIViewController {
        let interactor = resolveInteractor()
        let router = resolveRouter()
        let presenter = resolvePresenter(interactor: interactor,router: router)
        let view: BookTicketsViewController = resolveView(presenter: presenter)
        presenter.setView(view)
        router.setView(view)
        return view
    }
}

class BookTicketsBuilder: BookTicketsBuilderInterface {
}
