//  
//  TasksViewController.swift
//  Firebase
//
//  Created by Anton Vishnevsky on 13/02/2019.
//  Copyright © 2019 Wishell. All rights reserved.
//

import UIKit

final class TasksViewController: UIViewController {
    
    var model: TasksModelInput!
    lazy var contentView: TasksViewInput = { return view as! TasksViewInput }()
    
}

// MARK: - TasksModelOutput
extension TasksViewController: TasksModelOutput {}

// MARK: - TasksViewControllerInput
extension TasksViewController: TasksViewControllerInput {}
