//
//  EmbedView.swift
//  FeeManager
//
//  Created by Milovan Arsul on 12.01.2023.
//

import Foundation
import UIKit

class EmbedView{
    func embed(parent: UIViewController, container: UIView, child: Any, previous: UIViewController?){
        (child as? UIViewController)!.willMove(toParent: parent)
        parent.addChild((child as? UIViewController)!)
        container.addSubview((child as? UIViewController)!.view)
        (child as? UIViewController)!.didMove(toParent: parent)
        (child as? UIViewController)!.view.frame = CGRect(x: 0, y: 0, width: container.frame.size.width, height: container.frame.size.height)
    }
    
    func removeFromParent(viewController: UIViewController){
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
    func onboardingPageViewController(parent: OnboardingViewController, container: UIView){
        let child = OnboardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        embed(parent: parent, container: container, child: child, previous: parent.children.first)
        delegates.onboarding = child
    }
    
    func mainPageViewController(parent: MainViewController, container: UIView){
        let child = MainPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        embed(parent: parent, container: container, child: child, previous: parent.children.first)
        delegates.navigationBar = child
    }
}

let embed = EmbedView()
