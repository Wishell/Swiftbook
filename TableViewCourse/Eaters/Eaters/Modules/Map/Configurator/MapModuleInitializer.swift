//  
//  MapModuleInitializer.swift
//  Eaters
//
//  Created by Wishell on 04.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class MapModuleInitializer: NSObject {
    
    @IBOutlet weak var viewController: MapViewController!
    
    override func awakeFromNib() {
        let configurator = MapModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: viewController)
    }
    
}
