//
//  FeeActionTableViewCell.swift
//  FeeManager
//
//  Created by Milovan Arsul on 22.01.2023.
//

import Foundation
import UIKit

class FeeActionTableViewCell: UITableViewCell {
    lazy var resetButton: UIButton = {
        let button = UIButton()
        button.initialize(title: "Resetează", titleColor: .gray, cornerRadius: 12, font: UIFont(name: "IBMPlexSans-Bold", size: 18)!, backgroundColor: .white)
        button.layer.cornerRadius = 24
        button.layer.borderColor = UIColor.gray.cgColor
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(resetButtonPressed(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.initialize(title: "Salvează", titleColor: UIColor("#b64a44"), cornerRadius: 12, font: UIFont(name: "IBMPlexSans-Bold", size: 18)!, backgroundColor: .white)
        button.layer.cornerRadius = 24
        button.layer.borderColor = UIColor("#b64a44").cgColor
        button.layer.borderWidth = 2
        button.addTarget(self, action: #selector(saveButtonPressed(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var buttonsHorizontalStack: UIStackView = {
        let stackView = UIStackView()
        stackView.initalize(axis: .horizontal, alignment: .fill, distribution: .fill, spacing: 30)
        stackView.addAranagedSubviews(views: [resetButton, saveButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    var editingIndex: Int?
    
    func setup(){
        
        contentView.backgroundColor = .white
        contentView.addSubview(buttonsHorizontalStack)
        
        buttonsHorizontalStack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        buttonsHorizontalStack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        buttonsHorizontalStack.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.8).isActive = true
        buttonsHorizontalStack.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    @objc func resetButtonPressed(_ sender: UIButton){
        delegates.feeCreator.resetTable()
    }
    
    @objc func saveButtonPressed(_ sender: UIButton){
        fee.beautify()
        
        if let editingIndex = editingIndex{
            FirebaseFireStore.addFeeToUser(fee: fee, index: editingIndex)
        } else {
            FirebaseFireStore.addFeeToUser(fee: fee)
        }
        
        if FirebaseFireStore.currentUserData.hasDetails() == false{
            let userDetails = User(personType: fee.personType!, adresaPostala: fee.adresaPostala!, cnpAlPersoaneiCareFacePlata: fee.cnpAlPersoaneiCareFacePlata!)
            
            delegates.main.presentPickerView(pickerViewController: FeeCreatorAddDataPrompt(data: userDetails), animationType: .show)
        } else {
            delegates.home.reloadTableView()
            delegates.navigationBarView.removeView()
        }
    }
}
