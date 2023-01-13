//
//  NavigationBarView.swift
//  FeeManager
//
//  Created by Milovan Arsul on 12.01.2023.
//

import Foundation
import UIKit

class NavigationBarView: UIView{
    
    var currentItemLineXConstraint: NSLayoutConstraint?
    
    lazy var currentItemLine: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
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
        
        view.addSubviews([homeButton, analyticsButton, currentItemLine])
        
        homeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        homeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        homeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        homeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        analyticsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        analyticsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        analyticsButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        analyticsButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        currentItemLineXConstraint = currentItemLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        
        currentItemLineXConstraint!.isActive = true
        currentItemLine.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -3.5).isActive = true
        currentItemLine.widthAnchor.constraint(equalToConstant: 50).isActive = true
        currentItemLine.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        return view
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.initializeIcon(backgroundImage: UIImage(systemName: "plus.circle"), backgroundColor: .red, contentInsets: NSDirectionalEdgeInsets(top: 5, leading: 3, bottom: 5, trailing: 3),tintColour: .white)
        button.addTarget(self, action: #selector(plusButtonPressed(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
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
        plusButton.layer.cornerRadius = 0.5 * plusButton.bounds.size.width
        container.setShadow()
    }
    
    var containerWidth: NSLayoutConstraint?
    var containerHeight: NSLayoutConstraint?
    
    func setup(){
        backgroundColor = .clear
        
        addSubviews([container, plusButton])
        
        containerWidth = container.widthAnchor.constraint(equalTo: widthAnchor)
        containerHeight = container.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8)
        
        container.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerWidth!.isActive = true
        containerHeight!.isActive = true
        container.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        plusButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        plusButton.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 6).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: 65).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
        
    }
    
    func currentItemLineAnimation(animationDirection: AnimationDirection){
        currentItemLineXConstraint!.isActive = false
        
        switch animationDirection{
        case .forwards:
            currentItemLineXConstraint = currentItemLine.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20)
        case .backwards:
            currentItemLineXConstraint = currentItemLine.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20)
        }
        
        currentItemLineXConstraint!.isActive = true
        
        UIView.animate(withDuration: 0.4, animations: {
            self.currentItemLine.layoutIfNeeded()
            self.layoutIfNeeded()
        })
        
    }
    
    @objc func plusButtonPressed(_ sender: UIButton){
        plusButton.initializeIcon(backgroundImage: UIImage(systemName: "x.circle"), backgroundColor: .red, contentInsets: NSDirectionalEdgeInsets(top: 5, leading: 3, bottom: 5, trailing: 3),tintColour: .white)
    }
    
    @objc func homeButtonPressed(_ sender: UIButton){
        delegates.navigationBar.goToPage(pageIndex: 0, direction: .reverse)
        currentItemLineAnimation(animationDirection: .backwards)
    }
    
    @objc func analyticsButtonPressed(_ sender: UIButton){
        delegates.navigationBar.goToPage(pageIndex: 1, direction: .forward)
        currentItemLineAnimation(animationDirection: .forwards)
    }
}
