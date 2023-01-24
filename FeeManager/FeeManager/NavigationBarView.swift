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
    
    lazy var homeButton: UIButton = {
        let button = UIButton()
        button.initializeIcon(backgroundImage: UIImage(systemName: "house"))
        button.addTarget(self, action: #selector(homeButtonPressed(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var profileButton: UIButton = {
        let button = UIButton()
        button.initializeIcon(backgroundImage: UIImage(systemName: "person.circle"))
        button.addTarget(self, action: #selector(analyticsButtonPressed(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubviews([homeButton, profileButton, currentItemLine])
        
        homeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        homeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        homeButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        homeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        profileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        profileButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        profileButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        profileButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        currentItemLineXConstraint = currentItemLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        
        currentItemLineXConstraint!.isActive = true
        currentItemLine.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -3.5).isActive = true
        currentItemLine.widthAnchor.constraint(equalToConstant: 50).isActive = true
        currentItemLine.heightAnchor.constraint(equalToConstant: 2).isActive = true
        
        return view
    }()
    
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.initializeIcon(backgroundImage: UIImage(systemName: "plus.circle"), backgroundColor: .white, contentInsets: NSDirectionalEdgeInsets(top: 5, leading: 3, bottom: 5, trailing: 3),tintColour: .black)
        button.addTarget(self, action: #selector(plusButtonPressed(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.dropShadow = true
        return button
    }()
    
    init(){
        super.init(frame: .zero)
        delegates.navigationBarView = self
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        container.roundCorners([.topLeft, .topRight, .bottomLeft, .bottomRight], radius: 24)
        plusButton.layer.cornerRadius = 0.5 * plusButton.bounds.size.width
        container.dropShadow = true
    }
    
    var containerWidth: NSLayoutConstraint?
    var buttonTapped = false
    var customContainerView: UIView?
    
    func setup(){
        backgroundColor = .clear
        
        addSubviews([plusButton, container])
        sendSubviewToBack(container)
        
        plusButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        plusButton.widthAnchor.constraint(equalToConstant: 65).isActive = true
        plusButton.heightAnchor.constraint(equalToConstant: 65).isActive = true
        
        containerWidth = container.widthAnchor.constraint(equalTo: plusButton.widthAnchor, multiplier: 0.01)
        container.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        container.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8).isActive = true
        containerWidth!.isActive = true
        container.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        plusButton.topAnchor.constraint(equalTo: container.topAnchor, constant: -10).isActive = true
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
    
    func plusButtonAction(){
        homeButton.isHidden = !buttonTapped
        profileButton.isHidden = !buttonTapped
        currentItemLine.isHidden = !buttonTapped
        
        UIView.animate(withDuration: 0.3, animations: { [self] in
            switch buttonTapped{
                case true:
                    plusButton.transform = CGAffineTransform(rotationAngle: 0)
                    buttonTapped = false
                    delegates.main.addFee(type: .hide)
                    delegates.feeCreator.resetTable()
                    customContainerView!.removeFromSuperview()
                    fee = Fee()
                case false:
                    plusButton.transform = CGAffineTransform(rotationAngle: CGFloat.pi / 4)
                    buttonTapped = true
                    delegates.main.addFee(type: .show)
            }
        })
    }
    
    @objc func plusButtonPressed(_ sender: UIButton){
        plusButtonAction()
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

extension NavigationBarView: NavigationBarViewDelegate{
    func startupAnimation(){
        containerWidth!.isActive = false
        containerWidth = container.widthAnchor.constraint(equalTo: widthAnchor)
        containerWidth!.isActive = true
        
        UIView.animate(withDuration: 0.5, animations: { [self] in
            container.layoutIfNeeded()
            layoutIfNeeded()
        })
    }
    
    func addView(view: UIView){
        customContainerView = view
        customContainerView!.translatesAutoresizingMaskIntoConstraints = false
        container.addSubview(customContainerView!)
        
        customContainerView!.centerXAnchor.constraint(equalTo: container.centerXAnchor).isActive = true
        customContainerView!.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.9).isActive = true
        customContainerView!.topAnchor.constraint(equalTo: plusButton.bottomAnchor, constant: 0).isActive = true
        customContainerView!.bottomAnchor.constraint(equalTo: container.bottomAnchor).isActive = true
    }
    
    func removeView(){
        plusButtonAction()
    }
}
