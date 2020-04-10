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
    
    func set(title: String, imageString: String) {
        titleLabel.text = title
        imageView.image = UIImage(named: imageString)
    }
}
