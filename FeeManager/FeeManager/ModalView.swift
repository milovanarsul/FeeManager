//
//  ModalView.swift
//  FeeManager
//
//  Created by Milovan Arsul on 21.01.2023.
//

import Foundation
import UIKit

class ModalView: UIView{
    lazy var closeButton: UIButton = {
        let button = UIButton()
        button.initializeIcon(backgroundImage: UIImage(systemName: "x.circle"), tintColour: .gray)
        button.addTarget(self, action: #selector(closeButtonAction(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var content: UIViewController?
    var parent: MainViewController?
    
    init(content: UIViewController, parent: MainViewController){
        super.init(frame: .zero)
        self.content = content
        self.parent = parent
        setup()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    func setup(){
        backgroundColor = .white
        layer.cornerRadius = 24
        dropShadow = true
        
        FeeManager.embed.feePickerViewController(parent: parent!, container: contentView, child: content!)
        addSubviews([closeButton, contentView])
        
        closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 12).isActive = true
        closeButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 24).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
        
        contentView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: closeButton.bottomAnchor, constant: 4).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
    }
    
    @objc func closeButtonAction(_ sender: UIButton){
        delegates.main.presentPickerView(pickerViewController: nil, animationType: .hide)
    }
}
