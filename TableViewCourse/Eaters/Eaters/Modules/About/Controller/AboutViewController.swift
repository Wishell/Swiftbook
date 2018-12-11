//  
//  AboutViewController.swift
//  Eaters
//
//  Created by Wishell on 11.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class AboutViewController: UIViewController {
    
    var model: AboutModelInput!
    lazy var contentView: AboutViewInput = { return view as! AboutViewInput }()
    
}

// MARK: - AboutModelOutput
extension AboutViewController: AboutModelOutput {}

// MARK: - AboutViewControllerInput
extension AboutViewController: AboutViewControllerInput {}
