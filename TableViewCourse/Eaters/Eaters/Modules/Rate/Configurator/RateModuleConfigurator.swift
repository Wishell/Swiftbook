//  
//  RateModuleConfigurator.swift
//  Eaters
//
//  Created by Wishell on 04.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class RateModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? RateViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: RateViewController) {
        let model = RateModel()
        model.output = viewController
        
        viewController.model = model
    }
    
}
