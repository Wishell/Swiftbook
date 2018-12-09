//  
//  RateModuleInitializer.swift
//  Eaters
//
//  Created by Wishell on 04.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class RateModuleInitializer: NSObject {
    
    @IBOutlet weak var viewController: RateViewController!
    
    override func awakeFromNib() {
        let configurator = RateModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: viewController)
    }
    
}
