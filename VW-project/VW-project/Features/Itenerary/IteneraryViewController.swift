//
//  IteneraryViewController.swift
//  VW-project
//
//  Created by venazp on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//
//
//  VIPER Generator by Azisseno --  🐍 🐍 🐍 🐍
//

import UIKit

final class IteneraryViewController: UIViewController {

    // MARK: - Default properties -
    private var _presenter: IteneraryPresenterInterface!
    
    // MARK: - Module Setup -
    init?(coder: NSCoder, presenter: IteneraryPresenterInterface) {
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
        // Write your initial setup here
    }

}

// MARK: - Extensions -
extension IteneraryViewController: IteneraryViewInterface {
}
