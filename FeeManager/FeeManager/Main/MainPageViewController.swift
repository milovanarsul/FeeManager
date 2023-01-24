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
        let homeViewController = HomeViewController()
        pages.append(homeViewController)
        
        let analyticsViewController = UIViewController()
        pages.append(analyticsViewController)
    }
}

extension MainPageViewController: UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    }
}

extension MainPageViewController: NavigationBarDelegate{
    func goToPage(pageIndex: Int, direction: UIPageViewController.NavigationDirection) {
        goToIndex(pageIndex: pageIndex, direction: direction, pages: pages)
    }
}
