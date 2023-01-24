//
//  FeeCreatorUIPicker.swift
//  FeeManager
//
//  Created by Milovan Arsul on 21.01.2023.
//

import Foundation
import UIKit

class FeeCreatorPicker: UIViewController{

    var data: [(Int, String)]?
    var currentIndex: Int?
    
    lazy var picker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        picker.translatesAutoresizingMaskIntoConstraints = false
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerSetup()
    }
    
    init(data: [(Int, String)]? = nil, currentIndex: Int){
        if let data = data {
            self.data = data
        }
        
        self.currentIndex = currentIndex
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    func pickerSetup(){
        view.backgroundColor = .white
        view.addSubview(picker)
        
        picker.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        picker.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        picker.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        picker.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
}

extension FeeCreatorPicker: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data!.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let choice = data![row]
        appendFee(answer: choice, index: currentIndex!)
        delegates.feeCreator.updateSelectorCell(answer: [choice], index: IndexPath(row: currentIndex!, section: 0))
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let row = data![row].1
        return row
    }
    
    
}
