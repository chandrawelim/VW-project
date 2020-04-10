//
//  SingleImageView.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class SingleImageView: UIView, ViewFromNib {
    
    var view: UIView?
    var nibName: String {
        return "SingleImageView"
    }
    
    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
    }
    
    func set(imageString: String) {
        imageView.image = UIImage(named: imageString)
    }
}
