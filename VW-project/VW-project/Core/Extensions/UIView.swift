//
//  UIView.swift
//  VW-project
//
//  Created by Chandra Welim on 10/04/20.
//  Copyright © 2020 Chandra Welim. All rights reserved.
//

import UIKit

protocol ViewFromNib: class {
    var view: UIView? { get set }
    var nibName: String { get }
}

extension ViewFromNib where Self: UIView {
    
    func setupXIB() {
        guard let view = loadViewFromNib() else { return }
        view.frame = bounds
        addSubview(view)
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view = view
    }

    private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(
            withOwner: self,
            options: nil).first as? UIView
    }
}

extension UIView {
    
    func setGradient(colors: [UIColor]) {
        let cgColors = colors.map { $0.cgColor }
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = cgColors
        gradientLayer.locations = [0, 0, 0.52, 1]
        gradientLayer.startPoint = CGPoint(x: 0.25, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 0.75, y: 0.5)
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
