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
    var navigationBarView: NavigationBarViewDelegate! = nil
    var main: MainDelegate! = nil
    var feeCreator: FeeCreatorDelegate! = nil
    var home: HomeViewControllerDelegate! = nil
    
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

protocol NavigationBarViewDelegate{
    func startupAnimation()
    func addView(view: UIView)
    func removeView()
    func customFeeCreator(data: FeeCreator, completion: @escaping (_ finished: Bool) -> Void)
}

protocol MainDelegate{
    func addFee(type: AnimationType, data: FeeCreator, completion: @escaping (_ finished: Bool) -> Void)
    func presentPickerView(pickerViewController: UIViewController?, animationType: AnimationType)
    func presentFee(fee: UIViewController)
    func accountView(type: AnimationType)
    func goToOnboarding()
}

protocol FeeCreatorDelegate{
    func updateSelectorCell(answer: [(Int, String)], index: IndexPath)
    func resetTable()
    func initializeFeeTable(fee: Fee)
}

protocol HomeViewControllerDelegate{
    func reloadTableView()
}

let delegates: Delegates = Delegates()
