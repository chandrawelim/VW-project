//
//  SuccessFerriesWheel.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class SuccessFerriesWheel: UIView, ViewFromNib {
    
    var view: UIView?
    var nibName: String {
        return "SuccessFerriesWheel"
    }
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var amountTicketLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
    }
    
    func set(name: String, amount: String) {
        productNameLabel.text = name
        amountTicketLabel.text = amount
    }
}
