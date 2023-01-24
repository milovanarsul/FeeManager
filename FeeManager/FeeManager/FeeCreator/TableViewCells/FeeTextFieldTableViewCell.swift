//
//  FeeTextFieldTableViewCell.swift
//  FeeManager
//
//  Created by Milovan Arsul on 21.01.2023.
//

import UIKit

class FeeTextFieldTableViewCell: UITableViewCell {
    var data: CustomTextField?{
        didSet{
            guard let data = data else {return}
            
            if let placeHolder = data.placeholder {
                customTextField.placeholder = placeHolder
            }
            
            if data.text != nil {
                customTextField.text = data.text
            }
            
            if let image = data.image {
                customTextField.image = UIImage(named: image)
            }
        }
    }
    
    var currentFieldIndex: Int?
    
    lazy var customTextField: CustomUITextField = {
        let field = CustomUITextField()
        field.autocapitalizationType = .none
        field.autocorrectionType = .no
        field.isHighlightedOnEdit = false
        field.highlightedColor = .black
        
        field.smallPlaceholderColor = .black
        field.smallPlaceholderFont = UIFont(name: "IBMPlexSans-Regular", size: 15)!
        field.smallPlaceholderPadding = 6
        field.smallPlaceholderLeftOffset = 0
        
        field.separatorIsHidden = false
        field.separatorLineViewColor = field.smallPlaceholderColor
        field.separatorLeftPadding = -6
        field.separatorRightPadding = -6
        
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
        customTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        customTextField.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
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
    
    func setup(data: CustomTextField, currentFieldIndex: Int){
        self.data = data
        self.currentFieldIndex = currentFieldIndex
        
        selectionStyle = .none
        contentView.backgroundColor = .clear
        contentView.addSubview(container)
        
        container.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        container.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.85).isActive = true
    }
}

extension FeeTextFieldTableViewCell: UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
        customTextField.smallPlaceholderText = data!.placeholder!
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else {return}
        
        if text.count == 0 {
            customTextField.errorMessage = "Acest câmp este obligatoriu!"
        } else {
            customTextField.errorMessage = nil
            customTextField.smallPlaceholderText = data!.placeholder!
            appendFee(answer: text, index: currentFieldIndex! + 1)
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
    }
}
