//
//  HomeViewControllerTableViewCell.swift
//  FeeManager
//
//  Created by Milovan Arsul on 24.01.2023.
//

import Foundation
import UIKit

class HomeViewControllerTableViewCell: UITableViewCell{
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.layer.cornerRadius = 24
        tableView.layer.borderWidth = 3
        tableView.layer.borderColor = UIColor.gray.cgColor
        tableView.isUserInteractionEnabled = false
        return tableView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    var fee: Fee?
    var feeFieldsCount = 16
    
    func setup(fee: Fee){
        self.fee = fee
        contentView.backgroundColor = .white
        contentView.addSubviews([tableView])
        
        tableView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.95).isActive = true
        tableView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}

extension HomeViewControllerTableViewCell: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feeFieldsCount
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.item{
        case 0:
            return 80
        default:
            return 70
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = fee!.attributesStringArray(index: indexPath.item + 1)
        
        switch indexPath.item{
        case 0:
            let cell = CellTitle()
            cell.setup(title: data.1!, mainTitle: false)
            cell.selectionStyle = .none
            return cell
        default:
            let cell = CellFields()
            cell.setup(data: (data.0!, data.1!))
            cell.selectionStyle = .none
            return cell
        }
    }
}
