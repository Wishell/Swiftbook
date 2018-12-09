//  
//  DetailsModuleConfigurator.swift
//  Eaters
//
//  Created by Wishell on 03.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class DetailsModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? DetailsViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: DetailsViewController) {
        let model = DetailsModel()
        model.output = viewController
        
        viewController.datasource = DetailsDataSource()
        viewController.model = model
    }
    
}
