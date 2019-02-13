//  
//  LoginViewController.swift
//  Firebase
//
//  Created by Anton Vishnevsky on 13/02/2019.
//  Copyright © 2019 Wishell. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController {
    
    var model: LoginModelInput!
    lazy var contentView: LoginViewInput = { return view as! LoginViewInput }()
    
}

// MARK: - LoginModelOutput
extension LoginViewController: LoginModelOutput {}

// MARK: - LoginViewControllerInput
extension LoginViewController: LoginViewControllerInput {}
