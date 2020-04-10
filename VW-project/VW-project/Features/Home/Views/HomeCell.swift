//
//  HomeCell.swift
//  VW-project
//
//  Created by Chandra Welim on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .white
        layer.cornerRadius = 8
    }
    
    func setup(home: Home) {
        titleLabel.text = home.title
        imageView.image = UIImage(named: home.image)
    }
}
