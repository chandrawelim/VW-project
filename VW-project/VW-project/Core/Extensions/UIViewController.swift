//
//  UIViewController.swift
//  VW-project
//
//  Created by Chandra Welim on 11/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setTitle(title: String) {
        let label = UILabel()
        label.text = title
        label.font = UIFont.monseratBold(12)
        label.textColor = .white
        navigationItem.titleView = label
    }
}
