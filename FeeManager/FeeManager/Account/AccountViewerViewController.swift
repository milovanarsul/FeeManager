//
//  AccountViewerViewController.swift
//  FeeManager
//
//  Created by Milovan Arsul on 24.01.2023.
//

import Foundation
import UIKit

class AccountViewViewController: UIViewController{
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.initialize(text: "Contul tău", color: .black, font: UIFont(name: "IBMPlexSans-Bold", size: 28)!, alignment: .left, lines: 0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var logoutButton: UIButton = {
        var button = UIButton()
        button.initialize(title: "Log out", titleColor: .white, cornerRadius: 12, font: UIFont(name: "IBMPlexSans-Bold", size: 16)!, backgroundColor: UIColor("#b64a44"))
        button.addTarget(self, action: #selector(logoutButtonAction(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    var userData: [(String, String)]?
    
    func setup(){
        
        self.userData = FirebaseFireStore.currentUserData.userToArray()
        
        view.addSubviews([titleLabel, logoutButton,tableView])
        
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        logoutButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        logoutButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor).isActive = true
        logoutButton.heightAnchor.constraint(equalTo: titleLabel.heightAnchor, multiplier: 0.8).isActive = true
        logoutButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -10).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @objc func logoutButtonAction(_ sender: UIButton){
        do{
            try FirebaseAuthentication.authentication.signOut()
            delegates.main.accountView(type: .hide)
            delegates.main.goToOnboarding()
            FirebaseFireStore.clearData()
            
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
          }
    }
}

extension AccountViewViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userData!.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CellFields()
        let data = userData![indexPath.item]
        cell.setup(data: data)
        return cell
    }
    
    
}
