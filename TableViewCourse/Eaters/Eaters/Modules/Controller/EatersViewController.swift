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
    var dataSource: DataSource!
    
    override func viewDidLoad() {
        dataSource.attach(to: contentView.tableView!)
    }
}

// MARK: - EatersModelOutput
extension EatersViewController: EatersModelOutput {}

// MARK: - EatersViewControllerInput
extension EatersViewController: EatersViewControllerInput {}

extension EatersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .actionSheet)
        let Cancel = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
        let CallAction = UIAlertAction(title: "Call", style: .default) {(action) in
            let ac = UIAlertController(title: nil, message: "Call inactive", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .destructive, handler: nil)
            ac.addAction(action)
            self.present(ac, animated: true, completion: nil)
        }
        
        let isVisitedTitle = self.dataSource.isVisitedRestaurants[indexPath.row] ? "Я не был здесь" : "Я был здесь"
        
        let isVisited = UIAlertAction (title: isVisitedTitle, style: .default) {
            (action) in
            let cell = tableView.cellForRow(at: indexPath)
            self.dataSource.isVisitedRestaurants[indexPath.row] = !self.dataSource.isVisitedRestaurants[indexPath.row]
            cell?.accessoryType = self.dataSource.isVisitedRestaurants[indexPath.row] ? .checkmark : .none

            
        }
        alertController.addAction(CallAction)
        alertController.addAction(Cancel)
        alertController.addAction(isVisited)
        present(alertController, animated: true, completion: nil)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let share = UITableViewRowAction(style: .default, title: "share") { (action, IndexPath) in
            let defaultText = "I am at \(self.dataSource.restaurantNames[indexPath.row])"
            if let image = UIImage(named: self.dataSource.restaurantImages[indexPath.row]) {
                let activityController = UIActivityViewController(activityItems: [defaultText,image], applicationActivities: nil)
                self.present(activityController, animated: true, completion: nil)
            }
        }
        
        let delete = UITableViewRowAction(style: .default, title: "delete") { (action, IndexPath) in
            self.dataSource.restaurantImages.remove(at: indexPath.row)
            self.dataSource.restaurantNames.remove(at: indexPath.row)
            self.dataSource.isVisitedRestaurants.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        share.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
        delete.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        return [delete,share]
    }
    
}
