//
//  BookTicketCell.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class BookTicketCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .white
        layer.cornerRadius = 8
    }
    
    func setup(ticketPass: TicketPass) {
        imageView.image = UIImage(named: ticketPass.image)
        titleLabel.text = ticketPass.title
    }
}
