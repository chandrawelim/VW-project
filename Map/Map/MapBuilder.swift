//
//  MapBuilder.swift
//  Map
//
//  Created by Chandra Welim on 08/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import Foundation
import UIKit

protocol MapBuilderInterface {
    func resolveView(presenter: MapPresenterInterface) -> MapViewController
    func resolveInteractor() -> MapInteractorInterface
    func resolvePresenter(interactor: MapInteractorInterface,
                          router: MapRouterInterface) -> MapPresenterInterface    
    func resolveRouter() -> MapRouterInterface
}

extension MapBuilderInterface {
    func resolveView(presenter: MapPresenterInterface) -> MapViewController {
        let _storyboard = UIStoryboard(name: "Map", bundle: Bundle(for: MapBuilder.self))
        guard let view: MapViewController = _storyboard.instantiateInitialViewController(
            creator: { coder in
                MapViewController(coder: coder)
            }) else { fatalError("Initial View Controller is not set up") }
        view.set(presenter: presenter)
        return view
    }

    func resolveInteractor() -> MapInteractorInterface {
        return MapInteractor()
    }

    func resolvePresenter(interactor: MapInteractorInterface,
                          router: MapRouterInterface) -> MapPresenterInterface {
        return MapPresenter(interactor: interactor, router: router)
    }

    func resolveRouter() -> MapRouterInterface {
        return MapRouter()
    }
}

public class MapBuilder: MapBuilderInterface {

    public init() {}

    public func main() -> UIViewController {

        let interactor = resolveInteractor()
        let router = resolveRouter()
        let presenter = resolvePresenter(interactor: interactor,router: router)

        let view: MapViewController = resolveView(presenter: presenter)
        presenter.setView(view)
        router.setView(view)
        return view
    }
}
