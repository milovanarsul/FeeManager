//
//  NavigationBarView.swift
//  FeeManager
//
//  Created by Milovan Arsul on 12.01.2023.
//

import Foundation
import UIKit

class NavigationBarView: UIView{
    
    lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        lazy var homeButton: UIButton = {
            let button = UIButton()
            button.initializeIcon(backgroundImage: UIImage(systemName: "house"))
            button.addTarget(self, action: #selector(homeButtonPressed(_:)), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        lazy var analyticsButton: UIButton = {
            let button = UIButton()
            button.initializeIcon(backgroundImage: UIImage(systemName: "chart.pie"))
            button.addTarget(self, action: #selector(analyticsButtonPressed(_:)), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        view.addSubviews([homeButton, analyticsButton])
        
        homeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        homeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        homeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        homeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        analyticsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        analyticsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        analyticsButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        analyticsButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        return view
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.initializeIcon(backgroundImage: UIImage(systemName: "plus.circle"))
        button.addTarget(self, action: #selector(plusButtonPressed(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(){
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        container.roundCorners([.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 24)
    }
    
    func setup(){
        backgroundColor = .clear
        
        addSubviews([container, plusButton])
        
        container.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        container.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
        container.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        plusButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        plusButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: 60).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
    }
    
    @objc func plusButtonPressed(_ sender: UIButton){
        
    }
    
    @objc func homeButtonPressed(_ sender: UIButton){
        
    }
    
    @objc func analyticsButtonPressed(_ sender: UIButton){
        
    }
}
