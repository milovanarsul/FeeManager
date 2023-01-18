//
//  AccountActionButtonTableViewCell.swift
//  FeeManager
//
//  Created by Milovan Arsul on 16.01.2023.
//

import Foundation
import UIKit

class AccountActionButtonTableViewCell: UITableViewCell{
    var buttonText: String?{
        didSet{
            if let buttonText = buttonText{
                button.initialize(title: buttonText, titleColor: .white, cornerRadius: 8, font: UIFont(name: "IBMPlexSans-Bold", size: 16)!, backgroundColor: UIColor("#b64a44"))
            }
        }
    }
    var accountAction: AccountAction?
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(text: String, accountAction: AccountAction){
        self.buttonText = text
        self.accountAction = accountAction
        
        selectionStyle = .none
        
        contentView.backgroundColor = .clear
        contentView.addSubview(button)
        
        button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalToConstant: 90).isActive = true
    }
    
    @objc func buttonAction(_ sender: UIButton){
        if isOkay{
            switch accountAction {
                case .login:
                    FirebaseAuthentication.loginUser(email: email!, password: password!)
                case .signup:
                FirebaseAuthentication.signupUser(fullName: fullName!, email: email!, password: password!)
                case .none:
                    ()
            }
            isOkay = false
        }
    }
}
