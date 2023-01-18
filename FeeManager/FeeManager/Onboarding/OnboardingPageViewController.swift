//
//  OnboardingPageViewController.swift
//  FeeManager
//
//  Created by Milovan Arsul on 13.01.2023.
//

import Foundation
import UIKit

class OnboardingPageViewController: UIPageViewController{
    var pageViewControllerDataSource: UIPageViewControllerDataSource?
    var pages: [UIViewController] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageViewControllerDataSource = PageViewControllerDataSource(pages: pages)
        dataSource = pageViewControllerDataSource
        delegate = self
        
        createViewControllers()
        initialize(pages: pages, scroll: false)
    }
    
    func createViewControllers(){
        for card in onboardingCards{
            pages.append(OnboardingGeneralViewController(onboardingCard: card))
        }
        
        pages.append(AccountViewController(pageType: loginPage, accountAction: .login))
        pages.append(AccountViewController(pageType: signupPage, accountAction: .signup))
        
        pages.append(OnboardingGeneralViewController(onboardingCard: OnboardingCards(image: "onboarding6", mainLabel: "Te-ai logat cu succes!", secondaryLabel: "Vei fi redirecționat către aplicație în cateva momente")))
        pages.append(OnboardingGeneralViewController(onboardingCard: OnboardingCards(image: "onboarding6", mainLabel: "Te-ai înregistrat cu succes!", secondaryLabel: "Vei fi redirecționat către aplicație în cateva momente")))
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
