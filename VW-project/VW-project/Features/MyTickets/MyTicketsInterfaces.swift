//
//  MyTicketsInterfaces.swift
//  VW-project
//
//  Created by venazp on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit

enum MyTicketsNavigationOption {
}

protocol MyTicketsRouterInterface: class {
    func set(_ view: MyTicketsViewController)
    func navigate(to option: MyTicketsNavigationOption)
}

protocol MyTicketsViewInterface: class {
}

protocol MyTicketsPresenterInterface: class {
    init(_ interactor: MyTicketsInteractorInterface, _ router: MyTicketsRouterInterface)
    func set(_ view: MyTicketsViewInterface)
}

protocol MyTicketsInteractorInterface: class {
}
