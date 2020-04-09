//
//
//  TicketPresenter.swift
//  Ticket
//
//  Created by Chandra Welim on 08/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

public struct Ticket {
    public var img: String
    public var title: String
}

final class TicketPresenter {
    
    // MARK: - Default properties -
    private weak var _view: TicketViewInterface?
    private var _interactor: TicketInteractorInterface
    private var _router: TicketRouterInterface?
    
    let tickets: [Ticket] = [
        Ticket(img: "", title: "Hotel A")
    ]
    
    // MARK: - Module Setup -
    init(interactor: TicketInteractorInterface, router: TicketRouterInterface) {
        _interactor = interactor
        _router = router
    }
}

// MARK: - Extensions -
extension TicketPresenter: TicketPresenterInterface {
 
    func setView(_ view: TicketViewInterface) {
        _view = view
    }
    
    func viewDidLoad() {
        _view?.showTickets()
    }
    
    func numberOfRows() -> Int {
        return tickets.count
    }
    
    func getTicket(atIndex index: Int) -> Ticket {
        return tickets[index]
    }
    
    func openDetail(atIndex index: Int) {
        _router?.navigate(to: .ticketDetail(ticket: tickets[index]))
     }
}
