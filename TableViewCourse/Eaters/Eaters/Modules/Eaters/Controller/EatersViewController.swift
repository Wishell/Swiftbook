//  
//  EatersViewController.swift
//  Eaters
//
//  Created by Wishell on 02.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class EatersViewController: UIViewController {
    
    var model: EatersModelInput!
    lazy var contentView: EatersViewInput = { return view as! EatersViewInput }()
    var dataSource: EatersDataSource!
    
    override func viewDidLoad() {
        dataSource.attach(to: contentView.tableView!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsSeque" {
            let destinationVc = segue.destination as! DetailsViewController
            destinationVc.setData(sender as! Restaurant)
        }
    }
    
    @IBAction func close (segue: UIStoryboardSegue){}

}

// MARK: - EatersModelOutput
extension EatersViewController: EatersModelOutput {}

// MARK: - EatersViewControllerInput
extension EatersViewController: EatersViewControllerInput {}

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
        }
        
        share.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        delete.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        return [delete,share]
    }
    
}
