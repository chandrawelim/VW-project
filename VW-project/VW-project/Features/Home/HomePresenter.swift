//
//
//  HomePresenter.swift
//  VW-project
//
//  Created by venazp on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit

final class HomePresenter {

    // MARK: - Default properties -
    private weak var _view: HomeViewInterface?
    private var _interactor: HomeInteractorInterface
    private var _router: HomeRouterInterface?
    
    var arrayData: [Home] = [
        Home(title: "Tickets & Prices", image: "ticketPrice"),
        Home(title: "Find Your Way", image: "findYourWay"),
        Home(title: "Food & Drinks", image: "foodDrinks")
    ]

    // MARK: - Module Setup -
    init(_ interactor: HomeInteractorInterface, _ router: HomeRouterInterface) {
        _interactor = interactor
        _router = router
    }

    func set(_ view: HomeViewInterface) {
        _view = view
    }

}

// MARK: - Extensions -
extension HomePresenter: HomePresenterInterface {
    
    func viewDidLoad() {
        _view?.showHomeData()
    }
    
    func numberOfRows() -> Int {
        return arrayData.count
    }
    
    func getHomeData(atIndex index: Int) -> Home {
        return arrayData[index]
    }
    
    func openDetail(atIndex index: Int) {
        _router?.navigate(to: .bookTicket)
    }
}
