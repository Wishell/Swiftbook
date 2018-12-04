//  
//  RateView.swift
//  Eaters
//
//  Created by Wishell on 04.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

protocol RateViewInput: class {
    func annimateButtons (buttons: [UIButton])
    func getButtons()->[UIButton]
    var unwindSend:((String, UIButton)->Void)? {get set}
    
}

final class RateView: UIView {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var badButton: UIButton!
    @IBOutlet weak var goodButton: UIButton!
    @IBOutlet weak var brilliantButton: UIButton!
    
    
    @IBAction func setRate(sender: UIButton){
        switch sender.tag {
        case 0: unwindSend?("bad",sender)
        case 1: unwindSend?("good",sender)
        case 2: unwindSend?("brilliant",sender)
        default: break
        }
    }
    
    var unwindSend:((String,UIButton)->Void)?
    
    override func awakeFromNib() {
        badButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        goodButton.transform = CGAffineTransform(scaleX: 0, y: 0)
        brilliantButton.transform = CGAffineTransform(scaleX: 0, y: 0)
    }
}

// MARK: - RateViewInput
extension RateView: RateViewInput {
    
    func annimateButtons (buttons: [UIButton]) {
        for (index, button) in buttons.enumerated() {
            let delay = Double(index) * 0.3
            UIView.animate(withDuration: 0.8, delay: delay, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                button.transform = CGAffineTransform(scaleX: 1, y: 1)
            }, completion: nil)
        }
        
    }
    func getButtons()->[UIButton] {
        return [badButton,goodButton,brilliantButton]
    }
    
}
