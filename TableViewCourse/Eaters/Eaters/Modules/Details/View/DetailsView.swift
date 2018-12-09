//  
//  DetailsView.swift
//  Eaters
//
//  Created by Wishell on 03.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

protocol DetailsViewInput: class {
    func SetImage (image: Data)
    var tableView: UITableView! {get}
    func setButtonImage(image: Data)
}

final class DetailsView: UIView {
    @IBOutlet weak var bigImage: UIImageView!
    @IBOutlet weak var detailsTable: UITableView!
    @IBOutlet weak var rateButton: UIButton!
    
    @IBOutlet weak var mapButton: UIButton!
    override func awakeFromNib() {
        let buttons = [rateButton,mapButton]
        for button in buttons {
            guard let `button` = button else { break }
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.white.cgColor
        }
    }
}

// MARK: - DetailsViewInput
extension DetailsView: DetailsViewInput {
    func SetImage (image: Data){
        self.bigImage.image = UIImage(data: image)
    }
    
    var tableView: UITableView! {return detailsTable}
    
    func setButtonImage(image: Data){
        rateButton.setImage(UIImage(data: image), for: .normal)
    }
}
