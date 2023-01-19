//
//  OnboardingViewController.swift
//  FeeManager
//
//  Created by Milovan Arsul on 13.01.2023.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController{
    
    lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        view.isHidden = false
        view.setShadow()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.initialize(title: "Înapoi", titleColor: UIColor("#b64a44"), cornerRadius: 0, font: UIFont(name: "IBMPlexSans-Bold", size: 16)!, backgroundColor: .clear, image: UIImage(systemName: "chevron.left.circle"), imagePlacement: .leading)
        button.addTarget(self, action: #selector(backButtonAction(_:)), for: .touchUpInside)
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var onboardingPageViewController: UIView = {
        let view = UIView()
        FeeManager.embed.onboardingPageViewController(parent: self, container: view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var actionButton: UIButton = {
        let button = UIButton()
        button.initialize(title: "Mai departe", titleColor: .white, cornerRadius: 8, font: UIFont(name: "IBMPlexSans-Bold", size: 16)!, backgroundColor: UIColor("#b64a44"))
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var accountButtonsStack: UIStackView = {
        lazy var loginButton: UIButton = {
            let button = UIButton()
            button.initialize(title: "Loghează-te", titleColor: .white, cornerRadius: 8, font: UIFont(name: "IBMPlexSans-Bold", size: 16)!, backgroundColor: UIColor("#b64a44"), contentInsets: NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3),image: UIImage(systemName: "person.fill"), imagePlacement: NSDirectionalRectEdge.leading)
            button.addTarget(self, action: #selector(loginButtonAction(_:)), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        lazy var registerButton: UIButton = {
            let button = UIButton()
            button.initialize(title: "Înregistrează-te", titleColor: .white, cornerRadius: 8, font: UIFont(name: "IBMPlexSans-Bold", size: 16)!, backgroundColor: UIColor("#b64a44"), contentInsets: NSDirectionalEdgeInsets(top: 3, leading: 3, bottom: 3, trailing: 3),image: UIImage(systemName: "person.fill.badge.plus"), imagePlacement: NSDirectionalRectEdge.leading)
            button.addTarget(self, action: #selector(signupButtonAction(_:)), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.initalize(axis: .vertical, alignment: .fill, distribution: .fillEqually, spacing: 10)
        stackView.addAranagedSubviews(views: [loginButton, registerButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var errorView: AuthentificationError = {
        let view = AuthentificationError(text: "")
        view.clipsToBounds = true
        view.layer.cornerRadius = 24
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegates.onboardingViewController = self
        setup()
    }
    
    var containerWidthConstraint: NSLayoutConstraint?
    var containerHeightConstraint: NSLayoutConstraint?
    var pageViewControllerHeightConstraint: NSLayoutConstraint?
    
    func setup(){
        view.backgroundColor = UIColor("#f5ecdf")
        view.addSubview(container)
        
        containerWidthConstraint = container.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        containerHeightConstraint = container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7)
        container.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        containerWidthConstraint!.isActive = true
        containerHeightConstraint!.isActive = true
        
        container.addSubviews([backButton, onboardingPageViewController, actionButton])
        
        backButton.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10).isActive = true
        backButton.topAnchor.constraint(equalTo: container.topAnchor, constant: 10).isActive = true
        
        onboardingPageViewController.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        onboardingPageViewController.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: 15).isActive = true
        onboardingPageViewController.widthAnchor.constraint(equalTo: container.widthAnchor).isActive = true
        pageViewControllerHeightConstraint = onboardingPageViewController.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.7)
        pageViewControllerHeightConstraint!.priority = UILayoutPriority(999)
        pageViewControllerHeightConstraint!.isActive = true
        
        actionButton.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        actionButton.topAnchor.constraint(equalTo: onboardingPageViewController.bottomAnchor, constant: 30).isActive = true
    }
    
    @objc func backButtonAction(_ sender: UIButton){
        delegates.onboarding.goToPage(pageIndex: 4, direction: .reverse)
        backButton.isHidden = true
        accountButtonsStack.isHidden = false
        heightResizePageViewController(heightMultiplier: 0.7, shouldSetPriority: false)
    }
    
    @objc func buttonAction(_ sender: UIButton){
        switch delegates.onboarding.getCurrentIndex(){
            case 0...2:
                delegates.onboarding.nextPage()
            case 3:
                delegates.onboarding.nextPage()
                actionButton.isHidden = true

                container.addSubview(accountButtonsStack)
                accountButtonsStack.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
                accountButtonsStack.topAnchor.constraint(equalTo: onboardingPageViewController.bottomAnchor, constant: 0).isActive = true
                accountButtonsStack.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.7).isActive = true
                accountButtonsStack.heightAnchor.constraint(equalToConstant: 100).isActive = true
            case 7...8:
                presentMainViewController()
            default:
                ()
        }
    }
    
    @objc func loginButtonAction(_ sender: UIButton){
        delegates.onboarding.nextPage()
        backButton.isHidden = false
        accountButtonsStack.isHidden = true
        heightResizePageViewController(heightMultiplier: 0.97, shouldSetPriority: false)
    }
    
    @objc func signupButtonAction(_ sender: UIButton){
        delegates.onboarding.goToPage(pageIndex: delegates.onboarding.getCurrentIndex() + 2, direction: .forward)
        backButton.isHidden = false
        accountButtonsStack.isHidden = true
        heightResizePageViewController(heightMultiplier: 0.9, shouldSetPriority: false)
    }
    
    func heightResizePageViewController(heightMultiplier: CGFloat, shouldSetPriority: Bool){
        pageViewControllerHeightConstraint!.isActive = false
        pageViewControllerHeightConstraint = onboardingPageViewController.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: heightMultiplier)
        shouldSetPriority ? pageViewControllerHeightConstraint!.priority = UILayoutPriority(999) : ()
        pageViewControllerHeightConstraint!.isActive = true
    }
    
    var errorViewBottomAnchor: NSLayoutConstraint?
}

extension OnboardingViewController: OnboardingViewControllerDelegate{
    func displayErrorView(error: String){
        errorView.text = error
        errorView.setup()
        view.addSubview(errorView)
        
        errorViewBottomAnchor = errorView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 200)
        errorViewBottomAnchor!.isActive = true
        errorView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        errorView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        errorView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.23).isActive = true
    }
    
    func animateErrorView(type: AnimationType){
        errorViewBottomAnchor!.isActive = false
        switch type {
        case .show:
            errorViewBottomAnchor = errorView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        case .hide:
            errorViewBottomAnchor = errorView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 200)
        }
        errorViewBottomAnchor!.isActive = true
        
        UIView.animate(withDuration: 0.4, animations: {
            self.errorView.layoutIfNeeded()
            //self.view.layoutIfNeeded()
        }, completion: {finished in
            if type == .hide{
                self.errorView.removeFromSuperview()
            }
        })
    }
    
    func endOnboarding() {
        backButton.removeFromSuperview()
        accountButtonsStack.removeFromSuperview()
        heightResizePageViewController(heightMultiplier: 0.8, shouldSetPriority: true)
        actionButton.isHidden = false
    }
    
    func presentMainViewController(){
        onboardingPageViewController.removeFromSuperview()
        
        containerWidthConstraint!.isActive = false
        containerWidthConstraint = container.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.1)
        containerWidthConstraint!.isActive = true
        
        containerHeightConstraint!.isActive = false
        containerHeightConstraint = container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1.1)
        containerHeightConstraint!.isActive = true
        
        UIView.animate(withDuration: 0.4, animations: { [self] in
            container.layoutIfNeeded()
            view.layoutIfNeeded()
        }, completion: {finished in
            self.presentView(view: MainViewController(), animated: false, presentationStyle: .fullScreen, dismissPrevious: true)
            self.view.layoutIfNeeded()
            self.removeFromParent()
        })
    }
}
