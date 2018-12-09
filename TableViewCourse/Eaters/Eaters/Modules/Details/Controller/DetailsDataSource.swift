//
//  DataSource.swift
//  Eaters
//
//  Created by Wishell on 03.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class DetailsDataSource: NSObject {
    var restaurant: Restaurant?
    
    func attach (table: UITableView){
        table.dataSource = self
        table.delegate = self
        table.estimatedRowHeight = 38
        table.rowHeight = UITableView.automaticDimension
        let nib = UINib(nibName: "EateryDetailViewCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "EateryDetailViewCell")
        table.tableFooterView = UIView(frame: CGRect.zero)
    }
}

extension DetailsDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EateryDetailViewCell", for: indexPath) as! EateryDetailViewCell
        
        switch indexPath.row {
        case 0:
            cell.keyField.text = "Название"
            cell.valueField.text = restaurant?.name
        case 1:
            cell.keyField.text = "Тип"
            cell.valueField.text = restaurant?.type
        case 2:
            cell.keyField.text = "Адрес"
            cell.valueField.text = restaurant?.location
        case 3:
            cell.keyField.text = "Я там был?"
            cell.valueField.text = (restaurant?.isVisited)! ? "Да" : "Нет"
        default:
            break
        }
        return cell
    }
}

extension DetailsDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
