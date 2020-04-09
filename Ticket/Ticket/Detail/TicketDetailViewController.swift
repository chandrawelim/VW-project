//
//  TicketDetailViewController.swift
//  Ticket
//
//  Created by Chandra Welim on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

final class TicketDetailViewController: UIViewController {

    // MARK: - Default properties -
    private var _presenter: TicketDetailPresenterInterface!
    
    // MARK: - Module Setup -
    func set(presenter: TicketDetailPresenterInterface) {
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
extension TicketDetailViewController: TicketDetailViewInterface {
}
