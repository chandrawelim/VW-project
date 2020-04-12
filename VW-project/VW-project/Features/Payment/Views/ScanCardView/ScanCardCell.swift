//
//  ScanCardCell.swift
//  VW-project
//
//  Created by Chandra Welim on 11/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class ScanCardCell: UITableViewCell {

    @IBOutlet weak var scanCardView: ScanCardView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
}
