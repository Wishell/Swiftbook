//
//  DataSource.swift
//  Eaters
//
//  Created by Wishell on 02.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

class EatersDataSource: NSObject {
    
    var restaurants: [Restaurant] = [
        Restaurant(name: "Ogonёk Grill&Bar", type: "ресторан", location: "Уфа", image: "ogonek.jpg", isVisited: false),
        Restaurant(name: "Елу", type: "ресторан", location: "Уфа", image: "elu.jpg", isVisited: false),
        Restaurant(name: "Bonsai", type: "ресторан", location: "Уфа", image: "bonsai.jpg", isVisited: false),
        Restaurant(name: "Дастархан", type: "ресторан", location: "Уфа", image: "dastarhan.jpg", isVisited: false),
        Restaurant(name: "Индокитай", type: "ресторан", location: "Уфа", image: "indokitay.jpg", isVisited: false),
        Restaurant(name: "X.O", type: "ресторан-клуб", location: "Уфа", image: "x.o.jpg", isVisited: false),
        Restaurant(name: "Балкан Гриль", type: "ресторан", location: "Уфа", image: "balkan.jpg", isVisited: false),
        Restaurant(name: "Respublica", type: "ресторан", location: "Уфа", image: "respublika.jpg", isVisited: false),
        Restaurant(name: "Speak Easy", type: "ресторанный комплекс", location: "Уфа", image: "speakeasy.jpg", isVisited: false),
        Restaurant(name: "Morris Pub", type: "ресторан", location: "Уфа", image: "morris.jpg", isVisited: false),
        Restaurant(name: "Вкусные истории", type: "ресторан", location: "Уфа", image: "istorii.jpg", isVisited: false),
        Restaurant(name: "Классик", type: "ресторан", location: "Уфа", image: "klassik.jpg", isVisited: false),
        Restaurant(name: "Love&Life", type: "ресторан", location: "Уфа", image: "love.jpg", isVisited: false),
        Restaurant(name: "Шок", type: "ресторан", location: "Уфа", image: "shok.jpg", isVisited: false),
        Restaurant(name: "Бочка", type: "ресторан", location:  "Уфа", image: "bochka.jpg", isVisited: false)]
    
    
    func attach (to table: UITableView) {
        table.dataSource = self
        let nib = UINib(nibName: "EatersCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "EatersCell")
    }
    

}

extension EatersDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EatersCell", for: indexPath) as! EatersCell
        cell.icon.image = UIImage(named: restaurants[indexPath.row].image)
        cell.icon.layer.cornerRadius = 32.5
        cell.icon.clipsToBounds = true
        cell.LName.text = restaurants[indexPath.row].name
        cell.Llocation.text = restaurants[indexPath.row].location
        cell.Ltype.text = restaurants[indexPath.row].type
        cell.accessoryType = restaurants[indexPath.row].isVisited ? .checkmark: .none
        
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
