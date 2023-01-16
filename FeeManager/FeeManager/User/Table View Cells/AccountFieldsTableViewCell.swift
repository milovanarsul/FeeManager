//
//  AccountTableViewCells.swift
//  FeeManager
//
//  Created by Milovan Arsul on 16.01.2023.
//

import Foundation
import UIKit

class AccountFieldsTableViewCell: UITableViewCell {
    
    var data: CustomTextField?{
        didSet{
            guard let data = data else {return}
            
            if let smallPlaceHolder = data.smallPlaceHolderText {
                textField.smallPlaceholderText = smallPlaceHolder
            }
            
            if let placeHolder = data.placeholder {
                textField.placeholder = placeHolder
            }
            
            if let image = data.image {
                textField.image = UIImage(named: image)
            }
        }
    }
    
    lazy var textField: CustomUITextField = {
        let field = CustomUITextField()
        field.isHighlightedOnEdit = true
        field.highlightedColor = UIColor("#FF8766")
        
        field.smallPlaceholderColor = UIColor("#B26B58")
        field.smallPlaceholderFont = UIFont(name: "IBMPlexSans-Regular", size: 12)!
        field.smallPlaceholderPadding = 12
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
        
        view.addSubview(textField)
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        textField.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
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
        contentView.backgroundColor = .clear
        contentView.addSubview(container)
        
        container.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.9).isActive = true
        container.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.9).isActive = true
    }
}

extension AccountFieldsTableViewCell: UITextFieldDelegate {
    
}
