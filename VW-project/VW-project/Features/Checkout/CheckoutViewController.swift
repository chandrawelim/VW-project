//
//  CheckoutViewController.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

final class CheckoutViewController: UIViewController {
    
    // MARK: - Default properties -
    private var _presenter: CheckoutPresenterInterface!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonFooterView: ButtonFooterView!
    
    // MARK: - Module Setup -
    init?(coder: NSCoder, presenter: CheckoutPresenterInterface) {
        _presenter = presenter
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("(coder: NSCoder) has not been implemented")
    }
    
    // MARK: - View Controller Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        _setupView()
        
        buttonFooterView.buttonPressed = { [weak self] in
            self?._presenter.openNextScreen()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _setNavBar()
    }
    
    private func _setNavBar() {
        navigationController?.transparentBar()
        navigationController?.navigationBar.tintColor = .white
    }
    
    // MARK: - Setup Initial View
    private func _setupView() {
        tableView.backgroundView?.backgroundColor = .clear
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

// MARK: - Extensions -
extension CheckoutViewController: CheckoutViewInterface {
}

extension CheckoutViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "priceTicketCell", for: indexPath) as! PriceTicketCell
            cell.backgroundColor = .clear
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "calendarCell", for: indexPath) as! CalendarCell
            cell.calendarView.viewOnly()
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 226
        } else if indexPath.section == 1 {
            return 40
        }
        return 0
    }
}
