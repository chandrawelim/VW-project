//
//  ItineraryView.swift
//  Ticket
//
//  Created by Chandra Welim on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class ItineraryView: UIView {
    
    @IBOutlet weak var openHourLabel: UILabel!
    @IBOutlet weak var closeHourLabel: UILabel!
    @IBOutlet weak var venueNameLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var buttonAddItinenary: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    @IBAction func addItinenaryPressed(_ sender: UIButton) {
        
    }
}
