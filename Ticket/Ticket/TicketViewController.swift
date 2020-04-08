//
//  TicketViewController.swift
//  Ticket
//
//  Created by Chandra Welim on 08/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.

import UIKit

final class TicketViewController: UIViewController {

    // MARK: - Default properties -
    private var _presenter: TicketPresenterInterface!
    
    // MARK: - Module Setup -
    func set(presenter: TicketPresenterInterface) {
        _presenter = presenter
    }

    // MARK: - View Controller Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupView()
    }
	
    // MARK: - Setup Initial View
    private func _setupView() {
        // Write your initial setup here
    }

}

// MARK: - Extensions -
extension TicketViewController: TicketViewInterface {
}
