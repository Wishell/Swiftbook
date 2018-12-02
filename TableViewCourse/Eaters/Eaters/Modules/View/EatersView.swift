//  
//  EatersView.swift
//  Eaters
//
//  Created by Wishell on 02.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

protocol EatersViewInput: class {
    var tableView: UITableView! {get}
}

final class EatersView: UIView {
    @IBOutlet weak var table: UITableView!
    
}

// MARK: - EatersViewInput
extension EatersView: EatersViewInput {
    var tableView: UITableView! {return table}
}



