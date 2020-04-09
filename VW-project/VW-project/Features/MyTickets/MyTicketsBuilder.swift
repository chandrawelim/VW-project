//
//  MyTicketsBuilder.swift
//  VW-project
//
//  Created by venazp on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit

protocol MyTicketsBuilderInterface: class {
    func resolveInteractor() -> MyTicketsInteractorInterface
    func resolveRouter() -> MyTicketsRouterInterface
    func resolvePresenter(_ interactor: MyTicketsInteractorInterface,
                          _ router: MyTicketsRouterInterface) -> MyTicketsPresenterInterface
    func resolveView(_ presenter: MyTicketsPresenterInterface) -> MyTicketsViewController
}

extension MyTicketsBuilderInterface {
    func resolveInteractor() -> MyTicketsInteractorInterface {
        return MyTicketsInteractor()
    }
    
    func resolveRouter() -> MyTicketsRouterInterface {
        return MyTicketsRouter()
    }
    
    func resolvePresenter(_ interactor: MyTicketsInteractorInterface,
                          _ router: MyTicketsRouterInterface) -> MyTicketsPresenterInterface {
        return MyTicketsPresenter(interactor, router)
    }
    
    func resolveView(_ presenter: MyTicketsPresenterInterface) -> MyTicketsViewController {
        let _storyboard = UIStoryboard(name: "MyTickets", bundle: Bundle(for: MyTicketsBuilder.self))
        guard let view: MyTicketsViewController = _storyboard.instantiateInitialViewController(
            creator: { coder in
                MyTicketsViewController(coder: coder, presenter: presenter)
            }) else { fatalError("Initial MyTickets View Controller is not set") }
        return view
    }
    
    func main() -> UIViewController {
        let interactor = resolveInteractor()
        let router = resolveRouter()
        let presenter = resolvePresenter(interactor, router)
        let view: MyTicketsViewController = resolveView(presenter)
        presenter.set(view)
        router.set(view)
        return view
    }
}

class MyTicketsBuilder: MyTicketsBuilderInterface { }
