//
//  TwoImageLeftLabelView.swift
//  VW-project
//
//  Created by Chandra Welim on 11/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class TwoImageLeftLabelView: UIView, ViewFromNib {
    
    var view: UIView?
    var nibName: String {
        return "TwoImageLeftLabelView"
    }
    
    @IBOutlet weak var leftView: ImageLeftLabelView!
    @IBOutlet weak var rightView: ImageLeftLabelView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
    }
}
