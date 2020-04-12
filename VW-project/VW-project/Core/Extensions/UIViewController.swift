//
//  UIViewController.swift
//  VW-project
//
//  Created by Chandra Welim on 11/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func setTitle(title: String, color: UIColor = .white) {
        let label = UILabel()
        label.text = title
        label.font = UIFont.monseratBold(12)
        label.textColor = color
        navigationItem.titleView = label
    }
    
    func setBackButton(isWhite: Bool = true) {
        var items = [UIBarButtonItem]()
        let image = isWhite ? #imageLiteral(resourceName: "leftArrowWhite.pdf").withRenderingMode(.alwaysOriginal) : #imageLiteral(resourceName: "leftArrowBlack.pdf").withRenderingMode(.alwaysOriginal)
        let button = UIButton()
        button.setImage(image, for: .normal)
        button.addTarget(self, action:#selector(backPressed), for: .touchUpInside)
        button.frame = CGRect(x: 0, y: 0, width: 28, height: 60)
        button.widthAnchor.constraint(equalToConstant: button.frame.width).isActive = true
        
        let barButtonItemMenu = UIBarButtonItem()
        barButtonItemMenu.customView = button
        items.append(barButtonItemMenu)
        
        navigationItem.leftBarButtonItems = items
    }
    
    @objc func backPressed(_ sender: UIBarButtonItem) {
        navigationController?.popViewController(animated: true)
    }
}
