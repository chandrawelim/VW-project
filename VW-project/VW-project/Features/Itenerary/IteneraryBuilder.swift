//
//  IteneraryBuilder.swift
//  VW-project
//
//  Created by venazp on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit

protocol IteneraryBuilderInterface: class {
    func resolveInteractor() -> IteneraryInteractorInterface
    func resolveRouter() -> IteneraryRouterInterface
    func resolvePresenter(_ interactor: IteneraryInteractorInterface,
                          _ router: IteneraryRouterInterface) -> IteneraryPresenterInterface
    func resolveView(_ presenter: IteneraryPresenterInterface) -> IteneraryViewController
}

extension IteneraryBuilderInterface {
    func resolveInteractor() -> IteneraryInteractorInterface {
        return IteneraryInteractor()
    }
    
    func resolveRouter() -> IteneraryRouterInterface {
        return IteneraryRouter()
    }
    
    func resolvePresenter(_ interactor: IteneraryInteractorInterface,
                          _ router: IteneraryRouterInterface) -> IteneraryPresenterInterface {
        return IteneraryPresenter(interactor, router)
    }
    
    func resolveView(_ presenter: IteneraryPresenterInterface) -> IteneraryViewController {
        let _storyboard = UIStoryboard(name: "Itenerary", bundle: Bundle(for: IteneraryBuilder.self))
        guard let view: IteneraryViewController = _storyboard.instantiateInitialViewController(
            creator: { coder in
                IteneraryViewController(coder: coder, presenter: presenter)
            }) else { fatalError("Initial Itenerary View Controller is not set") }
        return view
    }
    
    func main() -> UIViewController {
        let interactor = resolveInteractor()
        let router = resolveRouter()
        let presenter = resolvePresenter(interactor, router)
        let view: IteneraryViewController = resolveView(presenter)
        presenter.set(view)
        router.set(view)
        return view
    }
}

class IteneraryBuilder: IteneraryBuilderInterface { }
