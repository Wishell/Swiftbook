//
//  MyButton.swift
//  MaskDemo
//
//  Created by Wishell on 18.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit
@IBDesignable
class MyButton: UIButton {
    @IBInspectable var cornerRadius:CGFloat = 0 {
        didSet {
            cornerRadii = CGSize(width: cornerRadius, height: cornerRadius)
        }
    }
    
    @IBInspectable var color: UIColor = .green
    private var cornerRadii = CGSize()
    
    var path: UIBezierPath?
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topRight, .bottomLeft], cornerRadii: cornerRadii)
        color.setFill()
        path?.fill()
    }

    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        if let path = path {
            return path.contains(point)
        }
        return false
    }
}
