//
//  FeeSelectorTableViewCell.swift
//  FeeManager
//
//  Created by Milovan Arsul on 21.01.2023.
//

import UIKit

class FeeSelectorTableViewCell: UITableViewCell {
    var data: FeeSelector?{
        didSet{
            if let data = data{
                selectorLabel.initialize(text: data.label!, color: .black, font: UIFont(name: "IBMPlexSans-Bold", size: 18)!, alignment: .left, lines: 0)
                
                var image: UIImage?
                switch data.type!{
                    case .select:
                        selectorViewLabel.initialize(text: (data.options?.first!.1)!, color: .gray, font: UIFont(name: "IBMPlexSans-Bold", size: 16)!, alignment: .left, lines: 0)
                        image = UIImage(systemName: "arrow.up.arrow.down")
                    case .date:
                        selectorViewLabel.initialize(text: "", color: .gray, font: UIFont(name: "IBMPlexSans-Bold", size: 15)!, alignment: .left, lines: 0)
                        image = UIImage(systemName: "calendar")
                    case .image:
                        selectorViewLabel.initialize(text: "", color: .gray, font: UIFont(name: "IBMPlexSans-Bold", size: 15)!, alignment: .left, lines: 0)
                        image = UIImage(systemName: "photo")
                }
                
                selectorViewImage.image = image
            }
        }
    }
    
    var currentIndex: Int?
    
    lazy var selectorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var selectorViewLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var datePicker: UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.date = Date()
        datePicker.datePickerMode = .date
        datePicker.backgroundColor = .clear
        datePicker.addTarget(self, action: #selector(datePickerDidChange(_:)), for: .valueChanged)
        datePicker.addTarget(self, action: #selector(datePickerTapped), for: .editingDidBegin)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        return datePicker
    }()
    
    lazy var selectorViewImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var selectorView: UIView = {
        let view = UIView()
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.gray.cgColor
        
        switch data!.type {
        case .select:
            view.addSubview(selectorViewLabel)
            
            selectorViewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
            selectorViewLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            selectorViewLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7).isActive = true
        case .date:
            view.addSubview(datePicker)
            
            datePicker.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
            datePicker.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
            datePicker.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.24).isActive = true
        default:
            ()
        }
        
        view.addSubview(selectorViewImage)
        
        selectorViewImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        selectorViewImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        selectorViewImage.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        selectorViewImage.widthAnchor.constraint(equalTo: selectorViewImage.heightAnchor, multiplier: (1.0) / (1.0)).isActive = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var selectorHorizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.backgroundColor = .clear
        stackView.initalize(axis: .vertical, alignment: .fill, distribution: .fillProportionally, spacing: 4)
        stackView.addAranagedSubviews(views: [selectorLabel, selectorView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        return stackView
    }()
    
    lazy var container: UIView = {
        let view = UIView()
        view.addSubview(selectorHorizontalStackView)
        
        selectorHorizontalStackView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        selectorHorizontalStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        selectorHorizontalStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        selectorHorizontalStackView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    func setup(data: FeeSelector, currentIndex: Int){
        self.data = data
        self.currentIndex = currentIndex
        
        selectionStyle = .none
        contentView.addSubview(container)
        
        container.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        container.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        container.widthAnchor.constraint(equalTo: contentView.widthAnchor).isActive = true
        container.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.9).isActive = true
    }
    
    @objc func datePickerDidChange(_ sender: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let result = dateFormatter.string(from: sender.date)
        appendFee(answer: result, index: currentIndex! + 2)
        sender.endEditing(true)
    }
    
    @objc func datePickerTapped(){
    }
}
