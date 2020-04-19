//
//  HomeCell.swift
//  VW-project
//
//  Created by Chandra Welim on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    @IBOutlet weak var homeView: HomeView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = 8
    }
}
