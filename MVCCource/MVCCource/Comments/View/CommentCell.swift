//
//  CommentCell.swift
//  MVCCource
//
//  Created by Wishell on 09.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

class CommentCell : UITableViewCell {
    @IBOutlet weak var label:UILabel!
    @IBOutlet weak var textView: UITextView!
    
    
    func configure(with comment: Comment){
        label.text = comment.name
        textView.text = comment.body
    }
}
