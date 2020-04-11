//
//  CheckListLabelView.swift
//  VW-project
//
//  Created by Chandra Welim on 11/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class CheckListLabelView: UIView, ViewFromNib {
    
    var view: UIView?
    var nibName: String {
        return "CheckListLabelView"
    }
    
    @IBOutlet weak var imageView: UIImageView!
    var isChecked: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        isChecked = !isChecked
        _updateCheckBox()
    }
    
    private func _updateCheckBox() {
        imageView.image = isChecked ? UIImage(named: "checked") : UIImage(named: "unchecked")
    }
    
    
}
