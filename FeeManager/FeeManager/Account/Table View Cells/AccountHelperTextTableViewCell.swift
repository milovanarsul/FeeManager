//
//  AccountHelperTextTableViewCell.swift
//  FeeManager
//
//  Created by Milovan Arsul on 16.01.2023.
//

import Foundation
import UIKit

class AccountHelperTextTableViewCell: UITableViewCell{
    var underline: Bool = false
    
    var text: String?{
        didSet{
            if let text = text{
                button.initialize(title: text, titleColor: .black, cornerRadius: 0, font: UIFont(name: "IBMPlexSans-Regular", size: 16)!, backgroundColor: .clear, underline: underline)
            }
        }
    }
    
    var action: AccountAction?{
        didSet{
            if action == action{
                switch action{
                case .signup:
                    underline = false
                case .login:
                    underline = true
                case .none:
                    ()
                }
            }
        }
    }
    
    lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonAction(_:)), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(text: String, action: AccountAction){
        selectionStyle = .none
        
        self.text = text
        self.action = action
        
        contentView.backgroundColor = .clear
        contentView.addSubview(button)
        
        button.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        button.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.97).isActive = true
    }
    
    @objc func buttonAction(_ sender: UIButton){
        
    }
    
}
