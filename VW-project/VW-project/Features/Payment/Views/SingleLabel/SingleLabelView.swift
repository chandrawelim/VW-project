//
//  SingleLabelView.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class SingleLabelView: UIView, ViewFromNib {
    
    var view: UIView?
    var nibName: String {
        return "SingleLabelView"
    }

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupXIB()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(title: String) {
        titleLabel.text = title
    }
}
