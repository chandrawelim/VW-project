//
//  HomeView.swift
//  VW-project
//
//  Created by Chandra Welim on 19/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//
//
//  UIView Template Generator by CWelim
//

import UIKit

class HomeView: UIView, ViewFromNib {
    
    var view: UIView?
    var nibName: String {
        return "HomeView"
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
        
        backgroundColor = .white
        layer.cornerRadius = 8
    }
    
    
    func setup(home: Home) {
        titleLabel.text = home.title
        imageView.image = UIImage(named: home.image)
    }
}
