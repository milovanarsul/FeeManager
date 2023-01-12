//
//  MainPageViewController.swift
//  FeeManager
//
//  Created by Milovan Arsul on 12.01.2023.
//

import Foundation
import UIKit

class MainPageViewController: UIPageViewController{
    
    fileprivate var pages: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let pageViewControllerDataSource = PageViewControllerDataSource(pages: pages)
        dataSource = pageViewControllerDataSource
        delegate = self
        
        createViewControllers()
        initialize(pages: pages, scroll: false)
        
    }
    
    fileprivate func createViewControllers(){
        let homeViewController = UIViewController()
        homeViewController.view.backgroundColor = .blue
        pages.append(homeViewController)
    }
}

extension MainPageViewController: UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
    }
}
