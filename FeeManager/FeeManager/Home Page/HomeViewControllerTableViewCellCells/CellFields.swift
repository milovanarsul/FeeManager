//
//  CellFields.swift
//  FeeManager
//
//  Created by Milovan Arsul on 24.01.2023.
//

import Foundation
import UIKit

class CellFields: UITableViewCell{
    var data: (String, String)?{
        didSet{
            if let data = data{
                smallLabel.initialize(text: data.0, color: .black, font: UIFont(name: "IBMPlexSans-Regular", size: 15)!, alignment: .left, lines: 1)
                text.initialize(text: data.1, color: .black, font: UIFont(name: "IBMPlexSans-Bold", size: 17)!, alignment: .left, lines: 0)
            }
        }
    }
    
    lazy var smallLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var text: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var container: UIView = {
        let view = UIView()
        view.addSubviews([smallLabel, text])
        
        smallLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        smallLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 4).isActive = true
        smallLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        
        text.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        text.topAnchor.constraint(equalTo: smallLabel.bottomAnchor, constant: 6).isActive = true
        text.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    func setup(data: (String, String)){
        self.data = data
        
        contentView.addSubview(container)
        
        container.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.87).isActive = true
        container.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.85).isActive = true
    }
}
