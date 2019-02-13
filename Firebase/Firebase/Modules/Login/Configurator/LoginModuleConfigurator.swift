//  
//  LoginModuleConfigurator.swift
//  Firebase
//
//  Created by Anton Vishnevsky on 13/02/2019.
//  Copyright © 2019 Wishell. All rights reserved.
//

import UIKit

final class LoginModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? LoginViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: LoginViewController) {
        let model = LoginModel()
        model.output = viewController
        
        viewController.model = model
    }
    
}
