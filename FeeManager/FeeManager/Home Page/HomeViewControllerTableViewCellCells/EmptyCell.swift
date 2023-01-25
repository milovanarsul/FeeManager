//
//  EmptyCell.swift
//  FeeManager
//
//  Created by Milovan Arsul on 24.01.2023.
//

import Foundation
import UIKit

class EmptyCell: UITableViewCell{
    lazy var plusButton: UIButton = {
        let button = UIButton()
        button.initializeIcon(backgroundImage: UIImage(systemName: "plus.circle"), backgroundColor: .clear, tintColour: UIColor("#4284aa"))
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    func setup(){
        contentView.backgroundColor = .clear
        contentView.layer.cornerRadius = 24
        contentView.layer.borderWidth = 3
        contentView.layer.borderColor = UIColor.gray.cgColor
        
        contentView.addSubview(plusButton)
        
        plusButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        plusButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        plusButton.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.35).isActive = true
        plusButton.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.35).isActive = true
        
    }
}
