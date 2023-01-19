//
//  AuthentificationError.swift
//  FeeManager
//
//  Created by Milovan Arsul on 19.01.2023.
//

import Foundation
import UIKit

class AuthentificationError: UIView{
    var text: String?
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.initialize(text: "Eroare", color: .white, font: UIFont(name: "IBMPlexSans-Bold", size: 18)!, alignment: .center, lines: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var confirmButton: UIButton = {
        let button = UIButton()
        button.initialize(title: "Am înțeles", titleColor: UIColor("#b64a44"), cornerRadius: 8, font: UIFont(name: "IBMPlexSans-Bold", size: 18)!, backgroundColor: .white)
        button.addTarget(self, action: #selector(confirmButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(text: String){
        super.init(frame: .zero)
        self.text = text
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    func setup(){
        backgroundColor = UIColor("#b64a44")
        descriptionLabel.initialize(text: text!, color: .white, font: UIFont(name: "IBMPlexSans-Regular", size: 15)!, alignment: .center, lines: 0)
        
        addSubviews([titleLabel, descriptionLabel, confirmButton])
        
        titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        
        descriptionLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        descriptionLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.85).isActive = true
        descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        
        confirmButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        confirmButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20).isActive = true
    }
    
    @objc func confirmButtonTapped(_ sender: UIButton){
        delegates.onboardingViewController.animateErrorView(type: .hide)
    }
}
