//
//  FeeCreatorAddDataPrompt.swift
//  FeeManager
//
//  Created by Milovan Arsul on 24.01.2023.
//

import Foundation
import UIKit

class FeeCreatorAddDataPrompt: UIViewController{
    lazy var mainLabel: UILabel = {
        let label = UILabel()
        label.initialize(text: "Salvează datele", color: .black, font: UIFont(name: "IBMPlexSans-Bold", size: 20)!, alignment: .center, lines: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var secondaryLabel: UILabel = {
        let label = UILabel()
        label.initialize(text: "Poți salva date, precum CNP-ul sau adresa poștală în contul tău pentru a fi completate automat la crearea unei noi amenzi", color: .black, font: UIFont(name: "IBMPlexSans-Bold", size: 16)!, alignment: .center, lines: 0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var actionButton: UIButton = {
        let button = UIButton()
        button.initialize(title: "Da, te rog", titleColor: .black, cornerRadius: 12, font: UIFont(name: "IBMPlexSans-Bold", size: 16)!, backgroundColor: .white)
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor("#b64a44").cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(actionButtonAction(_:)), for: .touchUpInside)
        return button
    }()
    
    var data: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    init(data: User){
        self.data = data
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    func setup(){
        view.addSubviews([mainLabel, secondaryLabel, actionButton])
        
        mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 10).isActive = true
        mainLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        secondaryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        secondaryLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 30).isActive = true
        secondaryLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85).isActive = true
        
        actionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        actionButton.topAnchor.constraint(equalTo: secondaryLabel.bottomAnchor, constant: 30).isActive = true
    }
    
    @objc func actionButtonAction(_ sender: UIButton){
        FirebaseFireStore.currentUserData.personType = data!.personType!
        FirebaseFireStore.currentUserData.adresaPostala = data!.adresaPostala!
        FirebaseFireStore.currentUserData.cnpAlPersoaneiCareFacePlata = data!.cnpAlPersoaneiCareFacePlata!
        
        FirebaseFireStore.addDetailsToUser(userDetails: FirebaseFireStore.currentUserData)
        delegates.main.presentPickerView(pickerViewController: nil, animationType: .hide)
        delegates.navigationBarView.removeView()
    }
}
