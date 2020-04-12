//
//  ScanCardView.swift
//  VW-project
//
//  Created by Chandra Welim on 11/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class ScanCardView: UIView, ViewFromNib {
    
    var view: UIView?
    var nibName: String {
        return "ScanCardView"
    }
    
    @IBOutlet weak var imageLeftLabelView: ImageLeftLabelView!
    @IBOutlet weak var buttonAction: UIButton!
    
    var onTap: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        onTap?()
    }
}
