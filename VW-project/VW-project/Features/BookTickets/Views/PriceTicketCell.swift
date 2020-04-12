//
//  PriceTicketCell.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class PriceTicketCell: UITableViewCell {

    @IBOutlet weak var priceTicketView: PriceTicketView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
