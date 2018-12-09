//
//  DataSource.swift
//  Eaters
//
//  Created by Wishell on 02.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

class EatersDataSource: NSObject {
    
    var restaurants: [Restaurant] = []
    var filteredResultArray: [Restaurant] = []
    var searchController: UISearchController!
    
    func attach (to table: UITableView, searchDelegate: UISearchResultsUpdating) {
        table.dataSource = self
        let nib = UINib(nibName: "EatersCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "EatersCell")
        table.estimatedRowHeight = 85
        table.rowHeight = UITableView.automaticDimension
        
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = searchDelegate
        searchController.dimsBackgroundDuringPresentation  = false
        table.tableHeaderView = searchController.searchBar
        
    }
    

}

extension EatersDataSource: UITableViewDataSource {
    
    func restaurantToDisplay(indexPath: IndexPath) -> Restaurant {
        let restaurant: Restaurant
        if searchController.isActive && searchController.searchBar.text != ""{
            restaurant = filteredResultArray[indexPath.row]
        } else {
            restaurant = restaurants[indexPath.row]
        }
        return restaurant
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       if searchController.isActive && searchController.searchBar.text != "" {
            return filteredResultArray.count
        }
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EatersCell", for: indexPath) as! EatersCell
        let restaurant = restaurantToDisplay(indexPath: indexPath)

        
        cell.icon.image = UIImage(data: restaurant.image! as Data)
        cell.icon.layer.cornerRadius = 32.5
        cell.icon.clipsToBounds = true
        cell.LName.text = restaurant.name
        cell.Llocation.text = restaurant.location
        cell.Ltype.text = restaurant.type
        cell.accessoryType = restaurant.isVisited ? .checkmark: .none
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            self.restaurantNames.remove(at: indexPath.row)
//            self.restaurantImages.remove(at: indexPath.row)
//            self.isVisitedRestaurants.remove(at: indexPath.row)
//        }
//
//        tableView.deleteRows(at: [indexPath], with: .top)
//    }


}

