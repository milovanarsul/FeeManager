//
//  OnboardingViewController.swift
//  FeeManager
//
//  Created by Milovan Arsul on 13.01.2023.
//

import Foundation
import UIKit

class OnboardingViewController: UIViewController{
    
    lazy var roundedIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "iconRounded")!
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var appName: UILabel = {
        let label = UILabel()
        label.initialize(text: "FeeManager", color: .black, font: UIFont(name: "IBMPlexSans-Bold", size: 16)!, alignment: .center, lines: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.initialize(text: "An App by Milovan Arsul", color: .black, font: UIFont(name: "IBMPlexSans-Bold", size: 12)!, alignment: .center, lines: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 30
        view.isHidden = true
        view.setShadow()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var onboardingPageViewController: UIView = {
        let view = UIView()
        FeeManager.embed.onboardingPageViewController(parent: self, container: view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isHidden = true
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startupSetup()
    }
    
    override func viewDidLayoutSubviews() {
        startupAnimation()
    }
    
    var containerWidthConstraint: NSLayoutConstraint?
    var containerHeightConstraint: NSLayoutConstraint?
    var containerYConstraint: NSLayoutConstraint?
    var appNameTopConstraint: NSLayoutConstraint?
    var descriptionLabelBottomConstraint: NSLayoutConstraint?
    
    func startupSetup(){
        view.backgroundColor = UIColor("#f5ecdf")
        view.addSubviews([container, appName, roundedIcon, descriptionLabel])
        
        containerWidthConstraint = container.widthAnchor.constraint(equalToConstant: 138)
        containerHeightConstraint = container.heightAnchor.constraint(equalToConstant: 138)
        containerYConstraint = container.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        containerWidthConstraint!.isActive = true
        containerHeightConstraint!.isActive = true
        containerYConstraint!.isActive = true
        container.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        roundedIcon.widthAnchor.constraint(equalToConstant: 150).isActive = true
        roundedIcon.heightAnchor.constraint(equalToConstant: 150).isActive = true
        roundedIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        roundedIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        appNameTopConstraint = appName.topAnchor.constraint(equalTo: roundedIcon.bottomAnchor, constant: 10)
        appNameTopConstraint?.isActive = true
        appName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        descriptionLabelBottomConstraint = descriptionLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        descriptionLabelBottomConstraint?.isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func startupAnimation(){
        appNameTopConstraint!.isActive = false
        appNameTopConstraint = appName.topAnchor.constraint(equalTo: roundedIcon.bottomAnchor, constant: -30)
        appNameTopConstraint!.isActive = true
        
        descriptionLabelBottomConstraint!.isActive = false
        descriptionLabelBottomConstraint = descriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 30)
        descriptionLabelBottomConstraint!.isActive = true
        
        UIView.animate(withDuration: 0.3, animations: { [self] in
            roundedIcon.layoutIfNeeded()
            appName.layoutIfNeeded()
            descriptionLabel.layoutIfNeeded()
            view.layoutIfNeeded()
        }, completion: {[self] finished in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){ [self] in
                appName.isHidden = true
                descriptionLabel.isHidden = true
                roundedIcon.isHidden = true
                container.isHidden = false
                containerAnimation()
            }
        })
    }
    
    func containerAnimation(){
        containerWidthConstraint!.isActive = false
        containerWidthConstraint = container.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        containerWidthConstraint!.isActive = true
        
        containerHeightConstraint!.isActive = false
        containerHeightConstraint = container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.8)
        containerHeightConstraint!.isActive = true
        
        UIView.animate(withDuration: 0.3, animations: { [self] in
            container.layoutIfNeeded()
            view.layoutIfNeeded()
        }, completion: {[self] finished in
            container.addSubview(onboardingPageViewController)
            
            onboardingPageViewController.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
            onboardingPageViewController.centerYAnchor.constraint(equalTo: container.centerYAnchor).isActive = true
            onboardingPageViewController.widthAnchor.constraint(equalTo: container.widthAnchor).isActive = true
            onboardingPageViewController.heightAnchor.constraint(equalTo: container.heightAnchor).isActive = true
        })
    }
}
