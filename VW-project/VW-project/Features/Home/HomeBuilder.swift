//
//  HomeBuilder.swift
//  VW-project
//
//  Created by venazp on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit

protocol HomeBuilderInterface: class {
    func resolveInteractor() -> HomeInteractorInterface
    func resolveRouter() -> HomeRouterInterface
    func resolvePresenter(_ interactor: HomeInteractorInterface,
                          _ router: HomeRouterInterface) -> HomePresenterInterface
    func resolveView(_ presenter: HomePresenterInterface) -> HomeViewController
}

extension HomeBuilderInterface {
    func resolveInteractor() -> HomeInteractorInterface {
        return HomeInteractor()
    }
    
    func resolveRouter() -> HomeRouterInterface {
        return HomeRouter()
    }
    
    func resolvePresenter(_ interactor: HomeInteractorInterface,
                          _ router: HomeRouterInterface) -> HomePresenterInterface {
        return HomePresenter(interactor, router)
    }
    
    func resolveView(_ presenter: HomePresenterInterface) -> HomeViewController {
        let _storyboard = UIStoryboard(name: "Home", bundle: Bundle(for: HomeBuilder.self))
        guard let view: HomeViewController = _storyboard.instantiateInitialViewController(
            creator: { coder in
                HomeViewController(coder: coder, presenter: presenter)
            }) else { fatalError("Initial Home View Controller is not set") }
        return view
    }
    
    func main() -> UIViewController {
        let interactor = resolveInteractor()
        let router = resolveRouter()
        let presenter = resolvePresenter(interactor, router)
        let view: HomeViewController = resolveView(presenter)
        presenter.set(view)
        router.set(view)
        return view
    }
}

class HomeBuilder: HomeBuilderInterface { }
