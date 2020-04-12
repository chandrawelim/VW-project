//
//  PriceTicketView.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

enum ButtonType {
    case readMore
    case edit
}

class PriceTicketView: UIView, ViewFromNib {
    
    var view: UIView?
    var nibName: String {
        return "PriceTicketView"
    }
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var readMoreButton: UIButton!
    
    var onPressed: (() -> Void)?
    var type: ButtonType = .readMore
    
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
    
    func set(title: String, imageString: String?, type: ButtonType) {
        // Add for download image later
        titleLabel.text = title
        
        switch type {
        case .edit:
            readMoreButton.setTitle("Edit", for: .normal)
        case .readMore:
            readMoreButton.setTitle("Read more", for: .normal)
        }
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        onPressed?()
    }
}
