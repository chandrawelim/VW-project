//
//  LabelSwitchView.swift
//  VW-project
//
//  Created by Chandra Welim on 11/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class LabelSwitchView: UIView, ViewFromNib {
    
    var view: UIView?
    var nibName: String {
        return "LabelSwitchView"
    }

    @IBOutlet weak var singleLabelView: SingleLabelView!
    @IBOutlet weak var saveCardSwitch: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
    }
}
