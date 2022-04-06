//
//  UIView+extensions.swift
//  Marvel
//
//  Created by Idwall Go Dev 008 on 05/04/22.
//

import UIKit

extension UIView {

    func gradientBackGround(firstColor: UIColor, secondColor: UIColor) {

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.locations = [0.4, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0.0)

        layer.insertSublayer(gradientLayer, at: 0)
    }
}
