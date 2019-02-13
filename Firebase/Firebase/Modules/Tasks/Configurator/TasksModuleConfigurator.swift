//  
//  TasksModuleConfigurator.swift
//  Firebase
//
//  Created by Anton Vishnevsky on 13/02/2019.
//  Copyright © 2019 Wishell. All rights reserved.
//

import UIKit

final class TasksModuleConfigurator {
    
    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        if let viewController = viewInput as? TasksViewController {
            configure(viewController: viewController)
        }
    }
    
    private func configure(viewController: TasksViewController) {
        let model = TasksModel()
        model.output = viewController
        
        viewController.model = model
    }
    
}
