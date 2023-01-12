//
//  ViewController.swift
//  FeeManager
//
//  Created by Milovan Arsul on 12.01.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    lazy var navigationBar: UIView = {
        let view = NavigationBarView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var mainPageViewController: UIView = {
        let view = UIView()
        FeeManager.embed.mainPageViewController(parent: self, container: view)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    func setup(){
        view.backgroundColor = .white
        
        view.addSubviews([mainPageViewController, navigationBar])
        
        navigationBar.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        navigationBar.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        navigationBar.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        navigationBar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07).isActive = true
        
        mainPageViewController.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainPageViewController.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainPageViewController.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        mainPageViewController.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
    }
    
}
