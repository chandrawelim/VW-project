//
//  PromoCodeView.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class PromoCodeView: UIView, ViewFromNib {
    
    var view: UIView?
    var nibName: String {
        return "PromoCodeView"
    }

    @IBOutlet weak var textFieldPromoCode: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
    }
}
