//
//  IteneraryInterfaces.swift
//  VW-project
//
//  Created by venazp on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit

enum IteneraryNavigationOption {
}

protocol IteneraryRouterInterface: class {
    func set(_ view: IteneraryViewController)
    func navigate(to option: IteneraryNavigationOption)
}

protocol IteneraryViewInterface: class {
}

protocol IteneraryPresenterInterface: class {
    init(_ interactor: IteneraryInteractorInterface, _ router: IteneraryRouterInterface)
    func set(_ view: IteneraryViewInterface)
}

protocol IteneraryInteractorInterface: class {
}
