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
    var restImage: Data?
    var datasource: DetailsDataSource!
    var rateImageName: String?
    
    override func viewDidLoad() {
        contentView.SetImage(image: restImage!)
        datasource.attach(table: contentView.tableView)
        title = datasource.restaurant?.name
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.hidesBarsOnSwipe = false
//        navigationController?.setNavigationBarHidden(false, animated: true)
//    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard let image = rateImageName else {return}
        contentView.setButtonImage(image: image)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mapSegue" {
            let vc = segue.destination as! MapViewController
            vc.restaurant = self.datasource.restaurant
        }
    }
}

// MARK: - DetailsModelOutput
extension DetailsViewController: DetailsModelOutput {}

// MARK: - DetailsViewControllerInput
extension DetailsViewController: DetailsViewControllerInput {
    
    func setData(_ restaurant: Restaurant) {
        self.datasource.restaurant = restaurant
        self.restImage = restaurant.image! as Data
    }
    
    func setRateData(_ image: String){
        self.rateImageName = image
    }
    
}
