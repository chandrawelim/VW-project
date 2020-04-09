//
//  MapBuilder.swift
//  VW-project
//
//  Created by venazp on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit

protocol MapBuilderInterface: class {
    func resolveInteractor() -> MapInteractorInterface
    func resolveRouter() -> MapRouterInterface
    func resolvePresenter(_ interactor: MapInteractorInterface,
                          _ router: MapRouterInterface) -> MapPresenterInterface
    func resolveView(_ presenter: MapPresenterInterface) -> MapViewController
}

extension MapBuilderInterface {
    func resolveInteractor() -> MapInteractorInterface {
        return MapInteractor()
    }
    
    func resolveRouter() -> MapRouterInterface {
        return MapRouter()
    }
    
    func resolvePresenter(_ interactor: MapInteractorInterface,
                          _ router: MapRouterInterface) -> MapPresenterInterface {
        return MapPresenter(interactor, router)
    }
    
    func resolveView(_ presenter: MapPresenterInterface) -> MapViewController {
        let _storyboard = UIStoryboard(name: "Map", bundle: Bundle(for: MapBuilder.self))
        guard let view: MapViewController = _storyboard.instantiateInitialViewController(
            creator: { coder in
                MapViewController(coder: coder, presenter: presenter)
            }) else { fatalError("Initial Map View Controller is not set") }
        return view
    }
    
    func main() -> UIViewController {
        let interactor = resolveInteractor()
        let router = resolveRouter()
        let presenter = resolvePresenter(interactor, router)
        let view: MapViewController = resolveView(presenter)
        presenter.set(view)
        router.set(view)
        return view
    }
}

class MapBuilder: MapBuilderInterface { }
