//
//  ProfileBuilder.swift
//  Profile
//
//  Created by Chandra Welim on 08/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.

import Foundation
import UIKit

protocol ProfileBuilderInterface {
    func resolveView(presenter: ProfilePresenterInterface) -> ProfileViewController
    func resolveInteractor() -> ProfileInteractorInterface
    func resolvePresenter(interactor: ProfileInteractorInterface,
                          router: ProfileRouterInterface) -> ProfilePresenterInterface    
    func resolveRouter() -> ProfileRouterInterface
}

extension ProfileBuilderInterface {
    func resolveView(presenter: ProfilePresenterInterface) -> ProfileViewController {
        let view: ProfileViewController = ProfileViewController()
        view.set(presenter: presenter)
        return view
    }

    func resolveInteractor() -> ProfileInteractorInterface {
        return ProfileInteractor()
    }

    func resolvePresenter(interactor: ProfileInteractorInterface,
                          router: ProfileRouterInterface) -> ProfilePresenterInterface {
        return ProfilePresenter(interactor: interactor, router: router)
    }

    func resolveRouter() -> ProfileRouterInterface {
        return ProfileRouter()
    }
}

public class ProfileBuilder: ProfileBuilderInterface {

    public init() {}

    public func main() -> UIViewController {

        let interactor = resolveInteractor()
        let router = resolveRouter()
        let presenter = resolvePresenter(interactor: interactor,router: router)

        let view: ProfileViewController = resolveView(presenter: presenter)
        presenter.setView(view)
        router.setView(view)
        return view
    }
}
