//
//
//  BookTicketsPresenter.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

struct TicketPass {
    var title: String
    var image: String
}

final class BookTicketsPresenter {
    
    // MARK: - Default properties -
    private weak var _view: BookTicketsViewInterface?
    private var _interactor: BookTicketsInteractorInterface
    private var _router: BookTicketsRouterInterface?
    
    let ticketPass: [TicketPass] = [
        TicketPass(title: "One-Day Pass", image: "gradientBlue"),
        TicketPass(title: "Season Pass", image: "gradientPurple"),
        TicketPass(title: "Family Pass", image: "gradientOrange")
    ]
    
    // MARK: - Module Setup -
    init(interactor: BookTicketsInteractorInterface, router: BookTicketsRouterInterface) {
        _interactor = interactor
        _router = router
    }
}

// MARK: - Extensions -
extension BookTicketsPresenter: BookTicketsPresenterInterface {
    func setView(_ view: BookTicketsViewInterface) {
        _view = view
    }
    
    func viewDidLoad() {
        _view?.showTicketPass()
    }
    
    func numberOfRows() -> Int {
        return ticketPass.count
    }
    
    func getTicketPass(atIndex index: Int) -> TicketPass {
        return ticketPass[index]
    }
    
    func openNextScreen() {
        _router?.navigate(to: .checkout)
    }
    
    func didSelectTicketPass(atIndex index: Int) {
        
    }
}
