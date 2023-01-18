//
//  AccountViewController.swift
//  FeeManager
//
//  Created by Milovan Arsul on 16.01.2023.
//

import Foundation
import UIKit

class AccountViewController: UIViewController{
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    var accountAction: AccountAction?
    var pageType: AccountPage?
    var numberOfItems: Int?
    
    init(pageType: AccountPage, accountAction: AccountAction){
        self.pageType = pageType
        self.accountAction = accountAction
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    func setup(){
        numberOfItems = 1 + pageType!.accountFieldsTableViewCells.count + 2
        
        view.backgroundColor = .clear
        view.addSubview(tableView)
        
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.95).isActive = true
    }
}

extension AccountViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + pageType!.accountFieldsTableViewCells.count + 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.item{
        case 0:
            switch accountAction{
            case .login:
                return 150
            case .signup:
                return 100
            case .none:
                return 0
            }
        case numberOfItems! - 2:
            return 100
        case numberOfItems! - 1:
            return 70
        default:
            return 70
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.item{
        case 0:
            return pageType!.accountHeaderTableViewCell
        case numberOfItems! - 2:
            return pageType!.accountHelperTextTableViewCell
        case numberOfItems! - 1:
            return pageType!.accountActionButtonTableViewCell
        default:
            return pageType!.accountFieldsTableViewCells[indexPath.item - 1]
        }
    }
}
