//  
//  EatersModuleInitializer.swift
//  Eaters
//
//  Created by Wishell on 02.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class EatersModuleInitializer: NSObject {
    
    @IBOutlet weak var viewController: EatersViewController!
    
    override func awakeFromNib() {
        let configurator = EatersModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: viewController)
    }
    
}
