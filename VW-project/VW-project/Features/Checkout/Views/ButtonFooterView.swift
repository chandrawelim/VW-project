//
//  ButtonFooterView.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class ButtonFooterView: UIView, ViewFromNib {
    
    var view: UIView?
    var nibName: String {
        return "ButtonFooterView"
    }
    
    @IBOutlet weak var totalPaymentLabel: UILabel!
    @IBOutlet weak var callToActionButton: UIButton!
    
    var buttonPressed: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
    }
    
    func set(total: String, buttonString: String) {
        totalPaymentLabel.text = total
        callToActionButton.setTitle(buttonString, for: .normal)
    }
    
    @IBAction func ctaPressed(_ sender: UIButton) {
        buttonPressed?()
    }
}
