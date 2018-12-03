//  
//  DetailsView.swift
//  Eaters
//
//  Created by Wishell on 03.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

protocol DetailsViewInput: class {
    func SetImage (image: String)
    var tableView: UITableView! {get}

}

final class DetailsView: UIView {
    @IBOutlet weak var bigImage: UIImageView!
    @IBOutlet weak var detailsTable: UITableView!
    @IBOutlet weak var rateButton: UIButton!
    
    override func awakeFromNib() {
        rateButton.layer.cornerRadius = 5
        rateButton.layer.borderWidth = 1
        rateButton.layer.borderColor = UIColor.white.cgColor
    }
}

// MARK: - DetailsViewInput
extension DetailsView: DetailsViewInput {
    func SetImage (image: String){
        self.bigImage.image = UIImage(named: image)
    }
    
     var tableView: UITableView! {return detailsTable}
}
