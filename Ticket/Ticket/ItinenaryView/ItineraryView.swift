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
    
    var onTapAddItenerary: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setup(openHour: String,
               closeHour: String,
               venueName: String,
               duration: String,
               locationName: String) {
        
        openHourLabel.text = openHour
        closeHourLabel.text = closeHour
        venueNameLabel.text = venueName
        durationLabel.text = duration
        locationNameLabel.text = locationName
    }
    
    @IBAction func addItinenaryPressed(_ sender: UIButton) {
        onTapAddItenerary?()
    }
}
