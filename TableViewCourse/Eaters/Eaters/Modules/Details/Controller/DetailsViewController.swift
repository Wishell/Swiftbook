//  
//  DetailsViewController.swift
//  Eaters
//
//  Created by Wishell on 03.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class DetailsViewController: UIViewController {
    
    var model: DetailsModelInput!
    lazy var contentView: DetailsViewInput = { return view as! DetailsViewInput }()
    var imageName: String?
    var datasource: DetailsDataSource!
    
    override func viewDidLoad() {
        contentView.SetImage(image: imageName ?? "")
        datasource.attach(table: contentView.tableView)
        title = datasource.restaurant?.name
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.hidesBarsOnSwipe = false
//        navigationController?.setNavigationBarHidden(false, animated: true)
//    }
    
}

// MARK: - DetailsModelOutput
extension DetailsViewController: DetailsModelOutput {}

// MARK: - DetailsViewControllerInput
extension DetailsViewController: DetailsViewControllerInput {
    
    func setData(_ restaurant: Restaurant) {
        self.datasource.restaurant = restaurant
        self.imageName = restaurant.image
    }
    
}
