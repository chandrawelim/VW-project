//
//  MyTicketsViewController.swift
//  VW-project
//
//  Created by venazp on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit

final class MyTicketsViewController: UIViewController {

    // MARK: - Default properties -
    private var _presenter: MyTicketsPresenterInterface!
    
    // MARK: - Module Setup -
    init?(coder: NSCoder, presenter: MyTicketsPresenterInterface) {
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
        _setNavBar()
    }
	
    // MARK: - Setup Initial View
    private func _setupView() {
        // Write your initial setup here
    }
    
    private func _setNavBar() {
        navigationController?.transparentBar()
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightCartIcon(self, action: #selector(onTapCartItem))
    }
}

// MARK: - Extensions -
extension MyTicketsViewController: MyTicketsViewInterface {
    @objc func onTapCartItem() {
        // DO SOMETHING
        print("COK")
    }

}
