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
    
    var roundedIconWidthConstraint: NSLayoutConstraint?
    var roundedIconYConstraint: NSLayoutConstraint?
    var roundedIconAspectRationConstraint: NSLayoutConstraint?
    var appNameTopConstraint: NSLayoutConstraint?
    var descriptionLabelBottomConstraint: NSLayoutConstraint?
    
    func startupSetup(){
        view.backgroundColor = UIColor(red: 245.0, green: 235.0, blue: 223.0, alpha: 1.0)
        
        view.addSubviews([roundedIcon, appName, descriptionLabel])
        
        roundedIconWidthConstraint = roundedIcon.widthAnchor.constraint(equalToConstant: 150)
        roundedIconYConstraint = roundedIcon.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        roundedIconAspectRationConstraint = roundedIcon.heightAnchor.constraint(equalTo: roundedIcon.widthAnchor, constant: (1.0) / (1.0))
        
        roundedIconWidthConstraint!.isActive = true
        roundedIconYConstraint!.isActive = true
        roundedIconAspectRationConstraint!.isActive = true
        roundedIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        appNameTopConstraint = appName.topAnchor.constraint(equalTo: roundedIcon.bottomAnchor, constant: 10)
        
        appNameTopConstraint!.isActive = true
        appName.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        descriptionLabelBottomConstraint = descriptionLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        
        descriptionLabelBottomConstraint!.isActive = true
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        //startupAnimation()
    }
    
    func startupAnimation(){
        roundedIconWidthConstraint = roundedIcon.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7)
        roundedIconYConstraint!.isActive = false
        roundedIcon.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6).isActive = true
        roundedIconAspectRationConstraint!.isActive = false
        appNameTopConstraint = appName.topAnchor.constraint(equalTo: roundedIcon.bottomAnchor, constant: -10)
        descriptionLabelBottomConstraint = descriptionLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
        
        UIView.animate(withDuration: 0.4, delay: 0.4, animations: { [self] in
            roundedIcon.layoutIfNeeded()
            appName.layoutIfNeeded()
            descriptionLabel.layoutIfNeeded()
            view.layoutIfNeeded()
        })
    }
}
