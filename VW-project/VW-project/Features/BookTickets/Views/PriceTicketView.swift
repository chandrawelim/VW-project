//
//  PriceTicketView.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class PriceTicketView: UIView, ViewFromNib {
    
    var view: UIView?
    var nibName: String {
        return "PriceTicketView"
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var readMoreButton: UIButton!
    
    var onPressed: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
        _configure()
    }
    
    private func _configure() {
        readMoreButton.layer.cornerRadius = 12
        readMoreButton.layer.borderWidth = 1
        readMoreButton.layer.borderColor = Color.lightOrange.cgColor
    }
    
    func set(title: String, imageString: String?) {
        titleLabel.text = title
        // Add for download image later
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        onPressed?()
    }
}
