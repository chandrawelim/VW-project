//
//  UINavigationController.swift
//  VW-project
//
//  Created by venazp on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

extension UINavigationController {
    
    func transparentBar() {
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.isTranslucent = true
        view.backgroundColor = .clear
    }
    
    func transparentBarWithCart() {
        transparentBar()
        let image = #imageLiteral(resourceName: "cart_ico").withRenderingMode(.alwaysOriginal)
        let rightButton = UIBarButtonItem(image: image,
                                          style: UIBarButtonItem.Style.plain,
                                          target: self,
                                          action: #selector(self.cartNavBarItemAction))
        navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func cartNavBarItemAction() {
        
    }
}

