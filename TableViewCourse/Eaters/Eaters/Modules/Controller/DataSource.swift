//
//  DataSource.swift
//  Eaters
//
//  Created by Wishell on 02.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

class DataSource: NSObject {
    
    var restaurantNames = ["Ogonёk Grill&Bar", "Елу", "Bonsai", "Дастархан", "Индокитай", "X.O", "Балкан Гриль", "Respublica", "Speak Easy", "Morris Pub", "Вкусные истории", "Классик", "Love&Life", "Шок", "Бочка"]
    
    var restaurantImages = ["ogonek.jpg", "elu.jpg", "bonsai.jpg", "dastarhan.jpg", "indokitay.jpg", "x.o.jpg", "balkan.jpg", "respublika.jpg", "speakeasy.jpg", "morris.jpg", "istorii.jpg", "klassik.jpg", "love.jpg", "shok.jpg", "bochka.jpg"]
    
    var isVisitedRestaurants = [Bool](repeating: false, count: 15)
    
    func attach (to table: UITableView) {
        table.dataSource = self
        let nib = UINib(nibName: "EatersCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "EatersCell")
    }
    

}

extension DataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EatersCell", for: indexPath) as! EatersCell
        cell.icon.image = UIImage(named: restaurantImages[indexPath.row])
        cell.icon.layer.cornerRadius = 32.5
        cell.icon.clipsToBounds = true
        cell.LName.text = restaurantNames[indexPath.row]
        
        cell.accessoryType = isVisitedRestaurants[indexPath.row] ? .checkmark: .none
        
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
