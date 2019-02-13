//  
//  TasksModuleInitializer.swift
//  Firebase
//
//  Created by Anton Vishnevsky on 13/02/2019.
//  Copyright © 2019 Wishell. All rights reserved.
//

import UIKit

final class TasksModuleInitializer: NSObject {
    
    @IBOutlet weak var viewController: TasksViewController!
    
    override func awakeFromNib() {
        let configurator = TasksModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: viewController)
    }
    
}
