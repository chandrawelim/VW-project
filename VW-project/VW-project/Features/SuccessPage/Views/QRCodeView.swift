//
//  QRCodeView.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class QRCodeView: UIView, ViewFromNib {
    
    var view: UIView?
    var nibName: String {
        return "QRCodeView"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
    }
}
