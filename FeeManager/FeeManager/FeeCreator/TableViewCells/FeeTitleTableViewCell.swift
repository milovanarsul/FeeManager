//
//  FeeTitleTableViewCell.swift
//  FeeManager
//
//  Created by Milovan Arsul on 21.01.2023.
//

import UIKit

class FeeTitleTableViewCell: UITableViewCell {
    var feeAction: FeeAction?{
        didSet{
            if let feeAction = feeAction{
                switch feeAction{
                    case .create:
                        titleLabel.initialize(text: "Adaugă o amendă nouă", color: .black, font: UIFont(name: "IBMPlexSans-Bold", size: 28)!, alignment: .left, lines: 0)
                    case .view:
                        titleLabel.initialize(text: "Nume amenda", color: .black, font: UIFont(name: "IBMPlexSans-Bold", size: 28)!, alignment: .left, lines: 0)
                    case .edit:
                        ()
                }
            }
        }
    }
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9).isActive = true
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    func setup(feeAction: FeeAction){
        self.feeAction = feeAction
        
        selectionStyle = .none
        contentView.addSubview(container)
        
        container.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        container.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        container.heightAnchor.constraint(equalTo: contentView.heightAnchor).isActive = true
    }

}
