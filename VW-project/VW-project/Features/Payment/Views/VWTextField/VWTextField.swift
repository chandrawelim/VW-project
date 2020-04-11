//
//  VWTextField.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class VWTextField: UIView, ViewFromNib {
    
    var view: UIView?
    var nibName: String {
        return "VWTextField"
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
    }
    
    func set(title: String) {
        titleLabel.text = title
    }
}
