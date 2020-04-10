//
//  UINavigationItem.swift
//  VW-project
//
//  Created by venazp on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

extension UINavigationItem {
    
    func rightCartIcon(_ target: Any?, action: Selector) {
        let image = #imageLiteral(resourceName: "cart_ico").withRenderingMode(.alwaysOriginal)
        let button = UIButton()
        button.setTitle(nil, for: .normal)
        button.setImage(image, for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        button.contentMode = .center
        button.backgroundColor = .white
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.addTarget(target, action: action, for: .touchUpInside)
        let rightButton = UIBarButtonItem()
        rightButton.customView = button
        rightBarButtonItem = rightButton
    }
}
