//
//  ItineraryCell.swift
//  VW-project
//
//  Created by Chandra Welim on 19/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class ItineraryCell: UITableViewCell {

    @IBOutlet weak var itineraryView: ItineraryView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itineraryView.backgroundColor = .clear
    }
}
