//  
//  LoginModuleInitializer.swift
//  Firebase
//
//  Created by Anton Vishnevsky on 13/02/2019.
//  Copyright © 2019 Wishell. All rights reserved.
//

import UIKit

final class LoginModuleInitializer: NSObject {
    
    @IBOutlet weak var viewController: LoginViewController!
    
    override func awakeFromNib() {
        let configurator = LoginModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: viewController)
    }
    
}
