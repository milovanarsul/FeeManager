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
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var mainPageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var secondaryPageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var onboardingCard: OnboardingCards?
    
    init(onboardingCard: OnboardingCards){
        self.onboardingCard = onboardingCard
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.setAnimationsEnabled(false)
        
        setup()
    }
    
    func setup(){
        pageImage.image = UIImage(named: onboardingCard!.image)!
        mainPageLabel.initialize(text: onboardingCard!.mainLabel, color: .black, font: UIFont(name: "IBMPlexSans-Bold", size: 25)!, alignment: .center, lines: 0)
        
        switch onboardingCard!.secondaryLabel != nil {
            case true:
            secondaryPageLabel.initialize(text: onboardingCard!.secondaryLabel!, color: .black, font: UIFont(name: "IBMPlexSans-Regular", size: 16)!, alignment: .center, lines: 0)
            
            view.addSubviews([pageImage, mainPageLabel, secondaryPageLabel])
            
            secondaryPageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            secondaryPageLabel.topAnchor.constraint(equalTo: mainPageLabel.bottomAnchor, constant: 30).isActive = true
            secondaryPageLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
            
            case false:
                view.addSubviews([pageImage, mainPageLabel])
        }
        
        
        pageImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80).isActive = true
        pageImage.widthAnchor.constraint(equalToConstant: 250).isActive = true
        pageImage.heightAnchor.constraint(equalTo: pageImage.widthAnchor, multiplier: (1.0 / 1.0), constant: 0).isActive = true
        
        mainPageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainPageLabel.topAnchor.constraint(equalTo: pageImage.bottomAnchor, constant: 20).isActive = true
        mainPageLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
    }
}
