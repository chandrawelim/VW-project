//
//  ProductViewConfirm.swift
//  VW-project
//
//  Created by Chandra Welim on 11/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class ProductViewConfirm: UIView, ViewFromNib {
    
    var view: UIView?
    var nibName: String {
        return "ProductViewConfirm"
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
    }
}
