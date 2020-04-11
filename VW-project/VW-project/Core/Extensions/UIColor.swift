//
//  UIColor.swift
//  VW-project
//
//  Created by Chandra Welim on 09/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat((hex & 0x0000FF)) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}

enum Color {
    static let orange = UIColor(hex: 0xDA6349)
    static let lightOrange = UIColor(hex: 0xEF6243)
    static let brown = UIColor(hex: 0x886861)
    static let whiteTwo = UIColor(hex: 0xFFF2E7)
    static let whiteThree = UIColor(hex: 0xE7E7E7)
    
    static let gradientOne = UIColor(hex: 0xFF8177)
    static let gradientTwo = UIColor(hex: 0xFF867A)
    static let gradientThree = UIColor(hex: 0xFFAC7F)
    static let gradientFour = UIColor(hex: 0xF99185)
}
