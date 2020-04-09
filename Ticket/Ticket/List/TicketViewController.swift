//
//  TicketViewController.swift
//  Ticket
//
//  Created by Chandra Welim on 08/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

final class TicketViewController: UIViewController {

    // MARK: - Default properties -
    private var _presenter: TicketPresenterInterface!
    
    @IBOutlet weak var tableView: UITableView!
        
    // MARK: - Module Setup -
    func set(presenter: TicketPresenterInterface) {
        _presenter = presenter
    }

    // MARK: - View Controller Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupView()
        _presenter.viewDidLoad()
    }
    
    // MARK: - Setup Initial View
    private func _setupView() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 80
        tableView.register(TicketCell.self, forCellReuseIdentifier: TicketCell.reuseID)
    }

}

// MARK: - Extensions -
extension TicketViewController: TicketViewInterface {
    func showTickets() {
        tableView.reloadData()
    }
}

extension TicketViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return _presenter.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TicketCell.reuseID) as! TicketCell
        cell.set(ticket: _presenter.getTicket(atIndex: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        _presenter.openDetail(atIndex: indexPath.row)
    }
}
