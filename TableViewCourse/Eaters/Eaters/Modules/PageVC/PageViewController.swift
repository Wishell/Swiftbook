//
//  PageViewController.swift
//  Eaters
//
//  Created by Wishell on 10.12.2018.
//  Copyright © 2018 Wishell. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
    var headersArray = ["Записывайте", "находите"]
    var subheadersArray = ["Создайте свой список любимых ресторанов", "Отметьте на карте Ваши рестораны"]
    var imagesArray = ["food", "iphoneMap"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        
        if let firstVC = displayViewController(atIndex: 0) {
            setViewControllers([firstVC], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
        }
        
        
    }
    
    func nextVC (atIndex index: Int ){
        if let contetVC = displayViewController(atIndex: index + 1) {
            setViewControllers([contetVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func displayViewController (atIndex index: Int) -> ContentViewController? {
        guard index >= 0 , index < headersArray.count else {return nil}
        guard let contentVC = storyboard?.instantiateViewController(withIdentifier: "contentViewController") as? ContentViewController else {return nil}
        contentVC.imageFile = imagesArray[index]
        contentVC.header = headersArray[index]
        contentVC.subheader = subheadersArray[index]
        contentVC.index = index
        
        return contentVC
    }
    
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ContentViewController).index
        index -= 1
        return displayViewController(atIndex: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        var index = (viewController as! ContentViewController).index
        index += 1
        return displayViewController(atIndex: index)
    }
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return headersArray.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        let contentVC = storyboard?.instantiateViewController(withIdentifier: "contentViewController") as? ContentViewController
        return contentVC!.index
    }
    
}
