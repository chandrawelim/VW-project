//
//  TwoTextFieldView.swift
//  VW-project
//
//  Created by Chandra Welim on 11/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class TwoTextFieldView: UIView, ViewFromNib {
    
    var view: UIView?
    var nibName: String {
        return "TwoTextFieldView"
    }
    
    @IBOutlet weak var leftTextField: VWTextField!
    @IBOutlet weak var rightTextField: VWTextField!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
    }
}
