//
//  EatersViewController.swift
//  Eaters
//
//  Created by Wishell on 02.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit
import CoreData

final class EatersViewController: UIViewController {
    
    var model: EatersModelInput!
    lazy var contentView: EatersViewInput = { return view as! EatersViewInput }()
    var dataSource: EatersDataSource!
    var fetchResultsController: NSFetchedResultsController<Restaurant>!
    
    
    func filterContentFor(searchText text: String) {
        dataSource.filteredResultArray = dataSource.restaurants.filter{ ($0.name?.lowercased().contains(text.lowercased()))!}
    }
    
    override func viewDidLoad() {
        dataSource.attach(to: contentView.tableView!, searchDelegate: self)
        
        let fetchRequest: NSFetchRequest<Restaurant> = Restaurant.fetchRequest()
        let descriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [descriptor]
        
         if let context = (UIApplication.shared.delegate as? AppDelegate)?.coreData.persistentContainer.viewContext {
        fetchResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            fetchResultsController.delegate = self
            do {
                try fetchResultsController.performFetch()
                dataSource.restaurants = fetchResultsController.fetchedObjects!
            } catch let error {
                print("Error \(error.localizedDescription)")
            }
        }
        definesPresentationContext = true

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let userDefaults = UserDefaults.standard
        let wasIntroWatched = userDefaults.bool(forKey: "wasIntroWatched")
        guard !wasIntroWatched else {return}
        if let pageVC = storyboard?.instantiateViewController(withIdentifier: "pageViewController") as? PageViewController{
            present(pageVC, animated: true, completion: nil)
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsSeque" {
            let destinationVc = segue.destination as! DetailsViewController
            destinationVc.setData(sender as! Restaurant)
        }
    }
    
    @IBAction func close (segue: UIStoryboardSegue){}

}
// MARK: - FetchResultControllerDelegate
extension EatersViewController: NSFetchedResultsControllerDelegate{
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.contentView.tableView.beginUpdates()
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        guard let `indexPath` = newIndexPath else {return}
        switch type {
        case .insert:
            self.contentView.tableView.insertRows(at: [indexPath], with: .fade)
        case .delete:
            self.contentView.tableView.deleteRows(at: [indexPath], with: .fade)
        case .update:
            self.contentView.tableView.reloadRows(at: [indexPath], with: .fade)
        default:
            self.contentView.tableView.reloadData()
        }
        self.dataSource.restaurants = controller.fetchedObjects as! [Restaurant]
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        self.contentView.tableView.endUpdates()
    }
    
}

// MARK: - EatersModelOutput
extension EatersViewController: EatersModelOutput {}

// MARK: - EatersViewControllerInput
extension EatersViewController: EatersViewControllerInput {}

// MARK: - UITableViewDelegate
extension EatersViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .actionSheet)
//        let Cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
//        let CallAction = UIAlertAction(title: "Call", style: .default) {(action) in
//            let ac = UIAlertController(title: nil, message: "Call inactive", preferredStyle: .alert)
//            let action = UIAlertAction(title: "OK", style: .destructive, handler: nil)
//            ac.addAction(action)
//            self.present(ac, animated: true, completion: nil)
//        }
//
//        let isVisitedTitle = self.dataSource.isVisitedRestaurants[indexPath.row] ? "Я не был здесь" : "Я был здесь"
//
//        let isVisited = UIAlertAction (title: isVisitedTitle, style: .default) {
//            (action) in
//            let cell = tableView.cellForRow(at: indexPath)
//            self.dataSource.isVisitedRestaurants[indexPath.row] = !self.dataSource.isVisitedRestaurants[indexPath.row]
//            cell?.accessoryType = self.dataSource.isVisitedRestaurants[indexPath.row] ? .checkmark : .none
//
//
//        }
//        alertController.addAction(CallAction)
//        alertController.addAction(Cancel)
//        alertController.addAction(isVisited)
//        present(alertController, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "DetailsSeque", sender: dataSource?.restaurants[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let share = UITableViewRowAction(style: .default, title: "share") { (action, IndexPath) in
            let defaultText = "I am at \(self.dataSource.restaurants[indexPath.row].name!)"
            if let image = UIImage(data:self.dataSource.restaurants[indexPath.row].image!) {
                let activityController = UIActivityViewController(activityItems: [defaultText,image], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        }
        
        let delete = UITableViewRowAction(style: .default, title: "delete") { (action, IndexPath) in
            self.dataSource.restaurants.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.coreData.persistentContainer.viewContext {
                
                let objectToDelete = self.fetchResultsController.object(at: indexPath)
                context.delete(objectToDelete)
                
                do {
                    try context.save()
                } catch let error {
                    print (error.localizedDescription)
                }
            }
        }
        
        share.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        delete.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        return [delete,share]
    }
    
}

extension EatersViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentFor(searchText: searchController.searchBar.text!)
        contentView.tableView.reloadData()
    }
    
    
}
