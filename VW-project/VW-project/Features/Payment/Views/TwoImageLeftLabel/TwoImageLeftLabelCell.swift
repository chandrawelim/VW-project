//
//  TwoImageLeftLabelCell.swift
//  VW-project
//
//  Created by Chandra Welim on 11/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class TwoImageLeftLabelCell: UITableViewCell {

    @IBOutlet weak var twoImageLeftLabelView: TwoImageLeftLabelView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
                selectionStyle = .none
    }
}
