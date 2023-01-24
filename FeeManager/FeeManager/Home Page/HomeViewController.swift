//
//  HomeViewController.swift
//  FeeManager
//
//  Created by Milovan Arsul on 13.01.2023.
//

import Foundation
import UIKit

class HomeViewController: UIViewController{
    
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
        
        delegates.home = self
        setup()
    }
    
    func setup(){
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = FirebaseFireStore.fees.count
        switch count{
        case 0:
            return 2
        default:
            return count + 1
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.item{
        case 0:
            return 80
        default:
            return 450
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.item{
        case 0:
            let cell = CellTitle()
            cell.setup(title: "Amenzi", mainTitle: true)
            return cell
        default:
            if FirebaseFireStore.fees.count == 0 {
                let cell = EmptyCell()
                cell.setup()
                cell.selectionStyle = .none
                return cell
            } else {
                let cell = HomeViewControllerTableViewCell()
                cell.setup(fee: FirebaseFireStore.fees[indexPath.item - 1])
                cell.selectionStyle = .none
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.item != 0 {
            let currentCell = tableView.cellForRow(at: indexPath) as! HomeViewControllerTableViewCell
            delegates.main.presentFee(fee: PresentFeeViewController(tableViewCell: currentCell, currentIndex: indexPath.item - 1))
        }
    }
}

extension HomeViewController: HomeViewControllerDelegate{
    func reloadTableView() {
        tableView.reloadData()
    }
}
