//
//  PriceTicketView.swift
//  Ticket
//
//  Created by Chandra Welim on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class PriceTicketView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var readMoreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        _configure()
    }
    
    private func _configure() {
        readMoreButton.setTitleColor(Color.brown, for: .normal)
        
        readMoreButton.layer.cornerRadius = 32
        readMoreButton.layer.borderWidth = 1
        readMoreButton.layer.borderColor = Color.red.cgColor
    }
    
    func set(title: String, imageString: String?) {
        titleLabel.text = title
        // Add for download image later
    }
    
    @IBAction func readMorePressed(_ sender: UIButton) {

    }
}
