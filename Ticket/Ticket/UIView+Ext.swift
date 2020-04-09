//
//  UIView+Ext.swift
//  Ticket
//
//  Created by Chandra Welim on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

extension UIView {
    class func initFromNib<T: UIView>() -> T {
        return UINib(nibName: String(describing: T.self), bundle: nil)
            .instantiate(withOwner: self, options: nil).first as! T
    }
}
