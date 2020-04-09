//
//  HomeInterfaces.swift
//  VW-project
//
//  Created by venazp on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit

enum HomeNavigationOption {
}

protocol HomeRouterInterface: class {
    func set(_ view: HomeViewController)
    func navigate(to option: HomeNavigationOption)
}

protocol HomeViewInterface: class {
}

protocol HomePresenterInterface: class {
    init(_ interactor: HomeInteractorInterface, _ router: HomeRouterInterface)
    func set(_ view: HomeViewInterface)
}

protocol HomeInteractorInterface: class {
}
