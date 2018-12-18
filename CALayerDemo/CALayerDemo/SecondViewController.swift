//
//  SecondViewController.swift
//  CALayerDemo
//
//  Created by Ivan Akulov on 07/12/2016.
//  Copyright © 2016 Ivan Akulov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, CAAnimationDelegate {
    var shape: CAShapeLayer! {
        didSet{
            shape.lineWidth = 20
            shape.lineCap = CAShapeLayerLineCap(rawValue: "round")
            shape.fillColor = nil
            shape.strokeEnd = 1
            shape.strokeColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1).cgColor
            
        }
    }
    
    var overShape: CAShapeLayer! {
        didSet{
            overShape.lineWidth = 20
            overShape.lineCap = CAShapeLayerLineCap(rawValue: "round")
            overShape.fillColor = nil
            overShape.strokeEnd = 0.3
            overShape.strokeColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1).cgColor
            
        }
    }
    
    var gradient: CAGradientLayer! {
        didSet{
            gradient.startPoint = CGPoint(x: 1, y: 0)
            gradient.endPoint = CGPoint(x: 0, y: 1)
            gradient.colors = [#colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1).cgColor,#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1).cgColor, #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).cgColor]
            gradient.locations = [0, 0.1]
        }
    }
    
    @IBOutlet weak var imageView: UIImageView!{
        didSet{
            imageView.layer.cornerRadius = imageView.frame.height / 2
            imageView.layer.masksToBounds = true
            imageView.layer.borderWidth = 10
            imageView.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            
        }
    }
    @IBOutlet weak var button: UIButton!{
        didSet{
            button.layer.shadowOffset = CGSize(width: 10, height: 10)
            button.layer.shadowOpacity = 0.5
            button.layer.shadowRadius = 5
            
        }
    }
    
    override func viewDidLayoutSubviews() {
        gradient.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width , height: self.view.bounds.height)
        shape.frame = view.bounds
        let path = UIBezierPath()
        path.move(to: CGPoint(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 3))
        path.addLine(to: CGPoint(x: self.view.frame.width / 2 + 100, y: self.view.frame.height / 3))
        shape.path = path.cgPath
        
        overShape.frame = view.bounds
        let overPath = UIBezierPath()
        overPath.move(to: CGPoint(x: self.view.frame.width / 2 - 100, y: self.view.frame.height / 3))
        overPath.addLine(to: CGPoint(x: self.view.frame.width / 2 + 100, y: self.view.frame.height / 3))
        overShape.path = overPath.cgPath
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradient = CAGradientLayer()
       view.layer.insertSublayer(gradient, at: 0)
        
        shape = CAShapeLayer()
        view.layer.addSublayer(shape)
        
        overShape = CAShapeLayer()
        view.layer.addSublayer(overShape)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @IBAction func tapped(_ sender: UIButton) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.duration = 2
        
        animation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.fillMode = .both
        animation.isRemovedOnCompletion = false
        animation.delegate = self
        
        overShape.add(animation, forKey: animation.keyPath)
    }
    
}

extension SecondViewController {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        performSegue(withIdentifier: "backSegue", sender: self)
    }
}
