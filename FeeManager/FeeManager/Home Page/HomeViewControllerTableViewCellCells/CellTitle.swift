//
//  CellTitle.swift
//  FeeManager
//
//  Created by Milovan Arsul on 24.01.2023.
//

import Foundation
import UIKit

class CellTitle: UITableViewCell{
    var title: String?{
        didSet{
            if let title = title{
                titleLabel.initialize(text: title, color: .black, font: UIFont(name: "IBMPlexSans-Bold", size: mainTitle! ? 31 : 28)!, alignment: .left, lines: 0)
            }
        }
    }
    
    var mainTitle: Bool?
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    func setup(title: String, mainTitle: Bool){
        self.mainTitle = mainTitle
        self.title = title
        
        contentView.addSubview(titleLabel)
        
        titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: mainTitle ? 1 : 0.87).isActive = true
    }
}
