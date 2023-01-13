//
//  OnboardingGeneralViewController.swift
//  FeeManager
//
//  Created by Milovan Arsul on 13.01.2023.
//

import Foundation
import UIKit

class OnboardingGeneralViewController: UIViewController{
    lazy var pageImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var pageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup(){
        view.addSubviews([pageImage, pageLabel, nextButton])
        
        pageImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        pageImage.widthAnchor.constraint(equalToConstant: 250).isActive = true
        pageImage.heightAnchor.constraint(equalTo: pageImage.widthAnchor, multiplier: (1.0 / 1.0), constant: 0).isActive = true
        
        pageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageLabel.topAnchor.constraint(equalTo: pageImage.bottomAnchor, constant: 50).isActive = true
        pageLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        
        nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nextButton.topAnchor.constraint(equalTo: pageLabel.bottomAnchor, constant: 50).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
}
