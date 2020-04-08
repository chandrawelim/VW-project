//
//  ProfileViewController.swift
//  Profile
//
//  Created by Chandra Welim on 08/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.

import UIKit

final class ProfileViewController: UIViewController {

    // MARK: - Default properties -
    private var _presenter: ProfilePresenterInterface!
    
    // MARK: - Module Setup -
    func set(presenter: ProfilePresenterInterface) {
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
extension ProfileViewController: ProfileViewInterface {
}
