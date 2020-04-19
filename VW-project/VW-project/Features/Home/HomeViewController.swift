//
//  HomeViewController.swift
//  VW-project
//
//  Created by venazp on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit

final class HomeViewController: UIViewController {
    
    // MARK: - Default properties -
    private var _presenter: HomePresenterInterface!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Module Setup -
    init?(coder: NSCoder, presenter: HomePresenterInterface) {
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.transparentBar()
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
extension HomeViewController: HomeViewInterface {
    func showHomeData() {
        tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 2 {
            let headerView = SingleLabelView()
            headerView.view?.backgroundColor = .clear
            headerView.set(title: "WHAT'S ON NOW")
            return headerView
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 2 {
            return 50
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! TitleCell
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
            cell.didTapCell = { [weak self] indexPathRow in
                self?._presenter.openDetail(atIndex: indexPathRow)
            }
            cell.data = _presenter.getArray()
            cell.backgroundColor = .clear
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItineraryCell", for: indexPath) as! ItineraryCell
            cell.backgroundColor = .clear
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 72
        } else if indexPath.section == 1{
            return 300
        } else {
            return 150
        }
    }
}


