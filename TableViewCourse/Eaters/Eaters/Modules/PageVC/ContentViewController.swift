//
//  ContentViewController.swift
//  Eaters
//
//  Created by Wishell on 10.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var subheaderLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pageButton: UIButton!
    
    var header = ""
    var subheader = ""
    var imageFile = ""
    var index = 0
    
    
    @IBAction func pageButtonPress(_ sender: UIButton) {
        switch index {
        case 0:
            let pageVC = parent as! PageViewController
            pageVC.nextVC(atIndex: index)
        case 1:
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "wasIntroWatched")
            userDefaults.synchronize()
            dismiss(animated: true, completion: nil)
        default:
            break
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageButton.layer.cornerRadius = 15
        pageButton.clipsToBounds = true
        pageButton.layer.borderWidth = 2
        pageButton.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        pageButton.layer.borderColor = (#colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)).cgColor
        
        switch index {
        case 0:
            pageButton.setTitle("Next", for: .normal)
        case 1:
            pageButton.setTitle("Open", for: .normal)
        default:
            break
        }
        
        headerLabel.text = header
        subheaderLabel.text = subheader
        imageView.image = UIImage(named: imageFile)
        pageControl.numberOfPages = 2
        pageControl.currentPage = index
    }
    
}
