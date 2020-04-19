//
//  ItineraryView.swift
//  Ticket
//
//  Created by Chandra Welim on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class ItineraryView: UIView, ViewFromNib {
    
    var view: UIView?
    var nibName: String {
        return "ItineraryView"
    }
    
    @IBOutlet weak var openHourLabel: UILabel!
    @IBOutlet weak var closeHourLabel: UILabel!
    @IBOutlet weak var venueNameLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var buttonAddItinenary: UIButton!
    
    var onTapAddItenerary: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
        _setupButton()
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
    
    private func _setupButton() {
        buttonAddItinenary.layer.borderColor = Color.lightOrange.cgColor
        buttonAddItinenary.layer.borderWidth = 1
        buttonAddItinenary.layer.cornerRadius = 4
    }
    
    @IBAction func addItinenaryPressed(_ sender: UIButton) {
        onTapAddItenerary?()
    }
}
