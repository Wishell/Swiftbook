//
//  DataSource.swift
//  Eaters
//
//  Created by Wishell on 03.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

final class DetailsDataSource: NSObject {
    
    func attach (table: UITableView){
        table.dataSource = self
        let nib = UINib(nibName: "EateryDetailViewCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "EateryDetailViewCell")
    }
}

extension DetailsDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EateryDetailViewCell", for: indexPath) as! EateryDetailViewCell
        cell.keyField.text = "Key Value"
        cell.valueField.text = "Value Text"
        return cell
    }
    
    
    
}
