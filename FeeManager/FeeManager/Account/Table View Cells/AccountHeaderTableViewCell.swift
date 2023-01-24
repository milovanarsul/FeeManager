//
//  HeaderTableViewCell.swift
//  FeeManager
//
//  Created by Milovan Arsul on 16.01.2023.
//

import Foundation
import UIKit

class AccountHeaderTableViewCell: UITableViewCell {
    
    var labelText: String? {
        didSet{
            if let labelText = labelText {
                label.initialize(text: labelText, color: .black, font: UIFont(name: "IBMPlexSans-Bold", size: 25)!, alignment: .center, lines: 1)
            }
        }
    }
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setup(text: String){
        self.labelText = text
        
        selectionStyle = .none
        contentView.backgroundColor = .clear
        contentView.addSubview(label)
        
        label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
