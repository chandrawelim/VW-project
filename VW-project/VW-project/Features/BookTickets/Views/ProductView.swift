//
//  ProductView.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

class ProductView: UIView, ViewFromNib {
    
    var view: UIView?
    var nibName: String {
        return "ProductView"
    }
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productCountLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    var plusPressed: (() -> Void)?
    var minusPressed: (() -> Void)?
    
    private var _count: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupXIB()
    }
    
    func set(productName: String, price: String, productCount: Int) {
        productNameLabel.text = productName
        priceLabel.text = price
        productCountLabel.text = String(productCount)
        _count = productCount
    }
    
    func getCount() -> Int {
        return _count
    }
    
    @IBAction func buttonPlusPressed(_ sender: UIButton) {
        plusPressed?()
    }
    
    @IBAction func buttonMinusPressed(_ sender: UIButton) {
        minusPressed?()
    }
}
