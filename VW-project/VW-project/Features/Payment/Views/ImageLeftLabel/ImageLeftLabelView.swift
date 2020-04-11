//
//  ImageLeftLabelView.swift
//  VW-project
//
//  Created by Chandra Welim on 11/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class ImageLeftLabelView: UIView, ViewFromNib {
    
    var view: UIView?
    var nibName: String {
        return "ImageLeftLabelView"
    }

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
    }
    
    func set(title: String,
             imageString: String,
             backgroundColor: UIColor = .white,
             textColor: UIColor = .black) {
        titleLabel.text = title
        imageView.image = UIImage(named: imageString)
        self.backgroundColor = backgroundColor
        titleLabel.textColor = textColor
    }
    
    func setBorder() {
        layer.borderWidth = 1
        layer.cornerRadius = 4
        layer.borderColor = Color.whiteThree.cgColor
    }
}
