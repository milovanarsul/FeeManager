//
//  LaunchViewController.swift
//  FeeManager
//
//  Created by Milovan Arsul on 19.01.2023.
//

import Foundation
import UIKit

class LaunchViewController: UIViewController {
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
        view.setShadow()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    var containerWidthConstraint: NSLayoutConstraint?
    var containerHeightConstraint: NSLayoutConstraint?
    var appNameTopConstraint: NSLayoutConstraint?
    var descriptionLabelBottomConstraint: NSLayoutConstraint?
    
    func setup(){
        view.backgroundColor = UIColor("#f5ecdf")
        view.addSubviews([appName, roundedIcon, descriptionLabel])
        
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
        
        startupAnimation()
    }
    
    func containerSetup(){
        view.addSubview(container)
        
        containerWidthConstraint = container.widthAnchor.constraint(equalToConstant: 138)
        containerWidthConstraint!.priority = UILayoutPriority(999)
        containerHeightConstraint = container.heightAnchor.constraint(equalToConstant: 138)
        containerHeightConstraint!.priority = UILayoutPriority(999)
        container.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        container.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        containerWidthConstraint!.isActive = true
        containerHeightConstraint!.isActive = true
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
            //view.layoutIfNeeded()
        }, completion: {[self] finished in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0){ [self] in
                appName.removeFromSuperview()
                descriptionLabel.removeFromSuperview()
                roundedIcon.removeFromSuperview()
                containerSetup()
                
                let notFirstLaunch = defaults.bool(forKey: "notFirstLaunch")
                
                if notFirstLaunch == false {
                    print("Onboarding presented")
                    onboarding()
                } else {
                    print("Main presented")
                    main()
                }
            }
        })
    }
    
    func onboarding(){
        containerWidthConstraint!.isActive = false
        containerWidthConstraint = container.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        containerWidthConstraint!.isActive = true
        
        containerHeightConstraint!.isActive = false
        containerHeightConstraint = container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7)
        containerHeightConstraint!.isActive = true
        
        UIView.animate(withDuration: 0.4, animations: { [self] in
            container.layoutIfNeeded()
        }, completion: {[self] finished in
            presentView(view: OnboardingViewController(), animated: false, presentationStyle: .fullScreen, dismissPrevious: false)
            self.view.layoutIfNeeded()
            self.removeFromParent()
            defaults.set(true, forKey: "notFirstLaunch")
        })
    }
    
    func main(){
        containerWidthConstraint!.isActive = false
        containerWidthConstraint = container.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1.1)
        containerWidthConstraint!.isActive = true
        
        containerHeightConstraint!.isActive = false
        containerHeightConstraint = container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1.1)
        containerHeightConstraint!.isActive = true
        
        UIView.animate(withDuration: 0.4, animations: { [self] in
            container.layoutIfNeeded()
        }, completion: {finished in
            self.presentView(view: MainViewController(), animated: false, presentationStyle: .fullScreen, dismissPrevious: false)
            self.view.layoutIfNeeded()
            self.removeFromParent()
        })
    }
}
