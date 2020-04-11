//
//  BookTicketsViewController.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

final class BookTicketsViewController: UIViewController {
    
    // MARK: - Default properties -
    private var _presenter: BookTicketsPresenterInterface!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let padding: CGFloat = 12
    
    // MARK: - Module Setup -
    init?(coder: NSCoder, presenter: BookTicketsPresenterInterface) {
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
        _presenter.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        _setNavBar()
    }
    
    private func _setNavBar() {
        setTitle(title: "BOOK YOUR TICKETS")
        navigationController?.transparentBar()
        navigationController?.navigationBar.tintColor = .white
    }
    
    // MARK: - Setup Initial View
    private func _setupView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundView?.backgroundColor = .clear
        collectionView.backgroundColor = .clear
        
        tableView.backgroundView?.backgroundColor = .clear
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - Extensions -
extension BookTicketsViewController: BookTicketsViewInterface {
    func showTicketPass() {
        collectionView.reloadData()
    }
}

extension BookTicketsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "priceTicketCell", for: indexPath) as! PriceTicketCell
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "calendarCell", for: indexPath) as! CalendarCell
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "productTableViewCell", for: indexPath) as! ProductTableViewCell
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

extension BookTicketsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return _presenter.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookTicketCell", for: indexPath) as! BookTicketCell
        cell.setup(ticketPass: _presenter.getTicketPass(atIndex: indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        _presenter.didSelectTicketPass(atIndex: indexPath.row)
    }
}

extension BookTicketsViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 104, height: 88)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
    }
}
