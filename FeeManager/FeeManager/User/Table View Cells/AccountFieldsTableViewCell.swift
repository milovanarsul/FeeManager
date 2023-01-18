//
//  AccountTableViewCells.swift
//  FeeManager
//
//  Created by Milovan Arsul on 16.01.2023.
//

import Foundation
import UIKit

var fullName: String?
var email: String?
var password: String?
var isOkay: Bool = false

class AccountFieldsTableViewCell: UITableViewCell{
    
    var data: CustomTextField?{
        didSet{
            guard let data = data else {return}
            
            if let smallPlaceHolder = data.smallPlaceHolderText {
                customTextField.smallPlaceholderText = smallPlaceHolder
            }
            
            if let placeHolder = data.placeholder {
                customTextField.placeholder = placeHolder
            }
            
            if let image = data.image {
                customTextField.image = UIImage(named: image)
            }
        }
    }
    
    lazy var customTextField: CustomUITextField = {
        let field = CustomUITextField()
        field.autocapitalizationType = .none
        field.isHighlightedOnEdit = true
        field.highlightedColor = UIColor("#FF8766")
        
        field.smallPlaceholderColor = UIColor("#B26B58")
        field.smallPlaceholderFont = UIFont(name: "IBMPlexSans-Regular", size: 15)!
        field.smallPlaceholderPadding = 8
        field.smallPlaceholderLeftOffset = 0
        
        field.separatorIsHidden = false
        field.separatorLineViewColor = field.smallPlaceholderColor
        field.separatorLeftPadding = -8
        field.separatorRightPadding = -8
        
        field.tintColor = .black
        field.placeholderColor = .black
        field.textColor = .black
        field.font = UIFont(name: "IBMPlexSans-Bold", size: 17)!
        
        field.delegate = self
        field.translatesAutoresizingMaskIntoConstraints = false
        
        return field
    }()
    
    lazy var container: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        view.addSubview(customTextField)
        customTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        customTextField.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        customTextField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 15).isActive = true
        customTextField.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    func setup(data: CustomTextField){
        self.data = data
        
        if data.type == .password || data.type == .verifyPassword {
            customTextField.isSecureTextEntry = true
        }
        
        selectionStyle = .none
        contentView.backgroundColor = .clear
        contentView.addSubview(container)
        
        container.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        container.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15).isActive = true
        container.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -3).isActive = true
    }
}

extension AccountFieldsTableViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {return}
        switch data!.type{
            case .password:
            if text.count < 5 {
                customTextField.errorMessage = "Parola trebuie să fie mai lungă de 5 caractere!"
                isOkay = false
            } else if text.count > 100 {
                customTextField.errorMessage = "Parola nu poate fi mai mare de 100 de caractere!"
                isOkay = false
            } else {
                password = text
                customTextField.errorMessage = nil
                isOkay = true
            }
            case .verifyPassword:
                if text == password{
                    customTextField.errorMessage = nil
                    isOkay = true
                } else {
                    customTextField.errorMessage = "Parola nu corespunde cu parola introdusă!"
                    isOkay = false
                }
            case .name:
            if text.count == 0{
                customTextField.errorMessage = "Acest câmp este obligatoriu!"
                isOkay = false
            } else {
                customTextField.errorMessage = nil
                fullName = text
                isOkay = true
            }
            case .email:
                ()
            case .none:
                ()
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let emailAdress = textField.text else {return false}
        switch data!.type {
            case .email:
            if emailAdress.isEmail() {
                email = emailAdress
                isOkay = true
            } else {
                customTextField.errorMessage = "Introdu o adresă validă de e-mail"
                isOkay = false
            }
            default:
                ()
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == customTextField{
            textField.resignFirstResponder()
        }
        return true
    }
}
