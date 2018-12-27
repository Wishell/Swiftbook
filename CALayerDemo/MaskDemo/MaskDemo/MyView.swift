//
//  MyView.swift
//  MaskDemo
//
//  Created by Wishell on 18.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit
@IBDesignable
class MyView: UIView {
    
    
    private var size = CGSize()
    @IBInspectable var cornerRadiiSize: CGFloat = 0 {
        didSet{
            size = CGSize(width: cornerRadiiSize, height: cornerRadiiSize)
        }
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: size).cgPath
        layer.mask = shapeLayer
    }
    
    override func prepareForInterfaceBuilder() {
        setNeedsLayout()
    }

}
