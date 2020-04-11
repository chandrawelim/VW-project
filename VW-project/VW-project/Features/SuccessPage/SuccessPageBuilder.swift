//
//  SuccessPageBuilder.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import Foundation
import UIKit

protocol SuccessPageBuilderInterface {
    func resolveView(presenter: SuccessPagePresenterInterface) -> SuccessPageViewController
    func resolveInteractor() -> SuccessPageInteractorInterface
    func resolvePresenter(interactor: SuccessPageInteractorInterface,
                          router: SuccessPageRouterInterface) -> SuccessPagePresenterInterface    
    func resolveRouter() -> SuccessPageRouterInterface
}

extension SuccessPageBuilderInterface {
    func resolveView(presenter: SuccessPagePresenterInterface) -> SuccessPageViewController {
       let _storyboard = UIStoryboard(name: "SuccessPage", bundle: Bundle(for: SuccessPageBuilder.self))
        guard let view: SuccessPageViewController = _storyboard.instantiateInitialViewController(
            creator: { coder in
                SuccessPageViewController(coder: coder, presenter: presenter)
            }) else { fatalError("Initial SuccessPage View Controller is not set") }
        return view
    }

    func resolveInteractor() -> SuccessPageInteractorInterface {
        return SuccessPageInteractor()
    }

    func resolvePresenter(interactor: SuccessPageInteractorInterface,
                          router: SuccessPageRouterInterface) -> SuccessPagePresenterInterface {
        return SuccessPagePresenter(interactor: interactor, router: router)
    }

    func resolveRouter() -> SuccessPageRouterInterface {
        return SuccessPageRouter()
    }
}

public class SuccessPageBuilder: SuccessPageBuilderInterface {

    public init() {}

    public func main() -> UIViewController {

        let interactor = resolveInteractor()
        let router = resolveRouter()
        let presenter = resolvePresenter(interactor: interactor,router: router)

        let view: SuccessPageViewController = resolveView(presenter: presenter)
        presenter.setView(view)
        router.setView(view)
        return view
    }
}
