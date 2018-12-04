//  
//  RateViewController.swift
//  Eaters
//
//  Created by Wishell on 04.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class RateViewController: UIViewController {
    
    var model: RateModelInput!
    lazy var contentView: RateViewInput = { return view as! RateViewInput }()
    var imageName: String?
    override func viewDidAppear(_ animated: Bool) {
        contentView.annimateButtons(buttons: contentView.getButtons())
    }
    
    override func viewDidLoad() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        blurView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        self.view.insertSubview(blurView, at: 1)
        contentView.unwindSend = { string, sender in
            self.imageName = string
            self.performSegue(withIdentifier: "unwindForDVC", sender: sender)
        }
    }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "unwindForDVC" {
                let destinationVc = segue.destination as! DetailsViewController
                guard let `imageName` = imageName else {return}
                destinationVc.setRateData(imageName)
            }
        }
    
}

// MARK: - RateModelOutput
extension RateViewController: RateModelOutput {}

// MARK: - RateViewControllerInput
extension RateViewController: RateViewControllerInput {}
