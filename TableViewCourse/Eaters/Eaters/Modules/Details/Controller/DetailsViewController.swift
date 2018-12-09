//  
//  DetailsViewController.swift
//  Eaters
//
//  Created by Wishell on 03.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit
import CoreData
final class DetailsViewController: UIViewController {
    
    var model: DetailsModelInput!
    lazy var contentView: DetailsViewInput = { return view as! DetailsViewInput }()
    var restImage: Data?
    var datasource: DetailsDataSource!
    //var rateImageName: String?
     var fetchResultsController: NSFetchedResultsController<Restaurant>!
    
    override func viewDidLoad() {
        let fetchRequest: NSFetchRequest<Restaurant> = Restaurant.fetchRequest()
        let descriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [descriptor]
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.coreData.persistentContainer.viewContext {
            fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
//            fetchResultsController.delegate = self
            do {
                try fetchResultsController.performFetch()
                datasource.restaurant = fetchResultsController.fetchedObjects?.first
            } catch let error {
                print("Error \(error.localizedDescription)")
            }
            
        }
        if let rateimage = datasource.restaurant?.rateImage {
            contentView.setButtonImage(image: rateimage)
            
        } else {
            print ("trash")// TODO Fix this bug
        }
        guard let bigImage = datasource.restaurant?.image else {return}
        contentView.SetImage(image: bigImage)
        
        datasource.attach(table: contentView.tableView)
        title = datasource.restaurant?.name
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.hidesBarsOnSwipe = false
//        navigationController?.setNavigationBarHidden(false, animated: true)
//    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        guard let image = (datasource.restaurant?.rateImage) else {return}
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
        //self.datasource.restaurant = restaurant
        //self.restImage = restaurant.image! as Data
    }
    
    func setRateData(_ image: String){
        //self.rateImageName = image
    }
    
}
