//  
//  RateViewController.swift
//  Eaters
//
//  Created by Wishell on 04.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit
import CoreData

final class RateViewController: UIViewController {
    
    var model: RateModelInput!
    lazy var contentView: RateViewInput = { return view as! RateViewInput }()
    var imageName: String?
    var fetchResultsController: NSFetchedResultsController<Restaurant>!
    
    override func viewDidAppear(_ animated: Bool) {
        contentView.annimateButtons(buttons: contentView.getButtons())
    }
    
    override func viewDidLoad() {
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = self.view.bounds
        blurView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        self.view.insertSubview(blurView, at: 1)
        
        contentView.unwindSend = { string, sender in
            self.imageName = string
            let fetchRequest: NSFetchRequest<Restaurant> = Restaurant.fetchRequest()
            let descriptor = NSSortDescriptor(key: "name", ascending: true)
            fetchRequest.sortDescriptors = [descriptor]
            
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.coreData.persistentContainer.viewContext {
                self.fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
                do {
                    try self.fetchResultsController.performFetch()
                    if let restaurant = self.fetchResultsController.fetchedObjects?.first {
                        restaurant.rateImage = UIImage(named: string)?.pngData()
                    }
                    try context.save()
                } catch let error {
                    print("Error \(error.localizedDescription)")
                }
            }
            
            
            self.performSegue(withIdentifier: "unwindForDVC", sender: sender)
        }
    }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "unwindForDVC" {
                let destinationVc = segue.destination as! DetailsViewController
                guard let `imageName` = imageName else {return}
                destinationVc.setRateData(imageName)
            }
        }
    
}

// MARK: - RateModelOutput
extension RateViewController: RateModelOutput {}

// MARK: - RateViewControllerInput
extension RateViewController: RateViewControllerInput {}
