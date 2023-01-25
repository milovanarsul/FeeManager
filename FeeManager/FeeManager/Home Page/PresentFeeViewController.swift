//
//  PresentFeeViewController.swift
//  FeeManager
//
//  Created by Milovan Arsul on 24.01.2023.
//

import Foundation
import UIKit

class PresentFeeViewController: UIViewController{
    lazy var editButton: UIButton = {
        let button = UIButton()
        button.initialize(title: "Editează amenda", titleColor: .systemBlue, cornerRadius: 0, font: UIFont(name: "IBMPlexSans-Bold", size: 16)!, backgroundColor: .clear, image: UIImage(systemName: "pencil"), imagePlacement: .leading)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(editButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.initialize(title: "Șterge amenda", titleColor: .gray, cornerRadius: 12, font: UIFont(name: "IBMPlexSans-Bold", size: 18)!, backgroundColor: .white)
        button.layer.cornerRadius = 12
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(deleteButtonPressed(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var payButton: UIButton = {
        let button = UIButton()
        button.initialize(title: "Plătește amenda", titleColor: UIColor("#b64a44"), cornerRadius: 12, font: UIFont(name: "IBMPlexSans-Bold", size: 18)!, backgroundColor: .white)
        button.layer.cornerRadius = 12
        button.layer.borderColor = UIColor("#b64a44").cgColor
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(payButtonPressed(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isHidden = true
        return button
    }()
    
    lazy var buttonsHorizontalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.initalize(axis: .horizontal, alignment: .fill, distribution: .fill, spacing: 10)
        stackView.addAranagedSubviews(views: [deleteButton, payButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var tableViewCell: HomeViewControllerTableViewCell?
    var currentIndex: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    init(tableViewCell: HomeViewControllerTableViewCell, currentIndex: Int){
        self.tableViewCell = tableViewCell
        self.currentIndex = currentIndex
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    func setup(){
        view.backgroundColor = .white
        view.addSubviews([editButton, tableViewCell!, buttonsHorizontalStack])
        
        editButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        editButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        
        tableViewCell!.tableView.isUserInteractionEnabled = true
        tableViewCell!.translatesAutoresizingMaskIntoConstraints = false
        tableViewCell!.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableViewCell!.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableViewCell!.topAnchor.constraint(equalTo: editButton.bottomAnchor).isActive = true
        tableViewCell!.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.85).isActive = true
        
        buttonsHorizontalStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonsHorizontalStack.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        buttonsHorizontalStack.topAnchor.constraint(equalTo: tableViewCell!.bottomAnchor, constant: 5).isActive = true
        buttonsHorizontalStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    }
    
    @objc func editButtonTapped(_ sender: UIButton){
        dismiss(animated: true)
        delegates.home.reloadTableView()
        delegates.navigationBarView.customFeeCreator(data: feeCreatorData, completion: {[self] finished in
            if finished{
                (feeCreatorCells[feeCreatorCells.count - 1] as! FeeActionTableViewCell).editingIndex = currentIndex!
                (feeCreatorCells[feeCreatorCells.count - 1] as! FeeActionTableViewCell).resetButton.isHidden = true
                delegates.feeCreator.initializeFeeTable(fee: FirebaseFireStore.fees[currentIndex!])
            }
        })
        
    }
    
    @objc func deleteButtonPressed(_ sender: UIButton){
        FirebaseFireStore.fees.remove(at: currentIndex!)
        delegates.home.reloadTableView()
        FirebaseFireStore.deleteFee()
        dismiss(animated: true)
    }
    
    @objc func payButtonPressed(_ sender: UIButton){
        
    }
    
}
