//  
//  EatersModuleConfigurator.swift
//  Eaters
//
//  Created by Wishell on 02.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class EatersModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? EatersViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: EatersViewController) {
        let model = EatersModel()
        model.output = viewController
        
        viewController.model = model
        viewController.dataSource = EatersDataSource()
    }
    
}
