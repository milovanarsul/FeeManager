//
//  Delegates.swift
//  FeeManager
//
//  Created by Milovan Arsul on 13.01.2023.
//

import Foundation
import UIKit

class Delegates{
    var navigationBar: NavigationBarDelegate! = nil
    var onboarding: OnboardingDelegate! = nil
    var onboardingViewController: OnboardingViewControllerDelegate! = nil
    
    init(){}
}

protocol NavigationBarDelegate{
    func goToPage(pageIndex: Int, direction: UIPageViewController.NavigationDirection)
}

protocol OnboardingDelegate{
    func getCurrentIndex() -> Int
    func nextPage()
    func goToPage(pageIndex: Int, direction: UIPageViewController.NavigationDirection)
    func getPageCount() -> Int
}

protocol OnboardingViewControllerDelegate{
    func displayErrorView(error: String)
    func animateErrorView(type: AnimationType)
    func endOnboarding()
    func presentMainViewController()
}

let delegates: Delegates = Delegates()
