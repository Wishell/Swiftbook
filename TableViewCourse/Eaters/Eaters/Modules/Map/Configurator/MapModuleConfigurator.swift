//  
//  MapModuleConfigurator.swift
//  Eaters
//
//  Created by Wishell on 04.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class MapModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? MapViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: MapViewController) {
        let model = MapModel()
        model.output = viewController
        
        viewController.model = model
    }
    
}
