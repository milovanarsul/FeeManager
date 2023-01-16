//
//  OnboardingPageViewController.swift
//  FeeManager
//
//  Created by Milovan Arsul on 13.01.2023.
//

import Foundation
import UIKit

class OnboardingPageViewController: UIPageViewController{
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
        for card in onboardingCards{
            pages.append(OnboardingGeneralViewController(onboardingCard: card))
        }
    }
}

extension OnboardingPageViewController: UIPageViewControllerDelegate{
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
    }
}

extension OnboardingPageViewController: OnboardingDelegate{
    func getCurrentIndex() -> Int {
        return getCurrentIndex(views: pages)
    }
    
    func nextPage() {
        let currentIndex = getCurrentIndex(views: pages)
        goToIndex(pageIndex: currentIndex + 1, direction: .forward, pages: pages)
    }
    
    func goToPage(pageIndex: Int, direction: UIPageViewController.NavigationDirection) {
        goToIndex(pageIndex: pageIndex, direction: direction, pages: pages)
    }
}
