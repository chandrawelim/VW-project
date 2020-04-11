//
//  SuccessPageViewController.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

final class SuccessPageViewController: UIViewController {
    
    // MARK: - Default properties -
    private var _presenter: SuccessPagePresenterInterface!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonOk: UIButton!
    
    // MARK: - Module Setup -
    init?(coder: NSCoder, presenter: SuccessPagePresenterInterface) {
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
    }
    
    // MARK: - Setup Initial View
    private func _setupView() {
        buttonOk.layer.cornerRadius = 8
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    @IBAction func okPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}

// MARK: - Extensions -
extension SuccessPageViewController: SuccessPageViewInterface {
}

extension SuccessPageViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "calendarCell", for: indexPath) as! CalendarCell
            cell.calendarView.viewOnly()
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "successFerriesWheelCell", for: indexPath) as! SuccessFerriesWheelCell
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "qrCodeCell", for: indexPath) as! QRCodeCell
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 40
        } else {
            return 300
        }
    }
}
