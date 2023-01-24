//
//  FeeCreatorViewController.swift
//  FeeManager
//
//  Created by Milovan Arsul on 21.01.2023.
//

import Foundation
import UIKit

var currentCellIndex: IndexPath = IndexPath(row: 0, section: 0)

class FeeCreatorViewController: UIViewController{
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.showsVerticalScrollIndicator = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    var data: FeeCreator?
    
    init(data: FeeCreator){
        self.data = data
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }
    
    func setup(){
        view.backgroundColor = .clear
        view.addSubview(tableView)
        
        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        tableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
}

extension FeeCreatorViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + data!.selectors!.count + data!.fields!.count + 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.item == 0{
            return 80
        }
        
        if feeCreatorCells[indexPath.item] is FeeSelectorTableViewCell{
            return 90
        }
        
        if feeCreatorCells[indexPath.item] is FeeActionTableViewCell{
            return 100
        }
        
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch feeCreatorCells[indexPath.item]{
            case is FeeSelectorTableViewCell:
                switch indexPath.item - 1 {
                    case 1...3:
                    delegates.main.presentPickerView(pickerViewController: FeeCreatorPicker(data: feeCreatorData.selectors![indexPath.item - 2].options!, currentIndex: indexPath.item), animationType: .show)
                    default:
                        ()
                }
            default:
                ()
        }
        currentCellIndex = indexPath
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return feeCreatorCells[indexPath.item]
    }
}

extension FeeCreatorViewController: FeeCreatorDelegate{
    func updateSelectorCell(answer: [(Int, String)]){
        let currentCell = tableView.cellForRow(at: currentCellIndex) as! FeeSelectorTableViewCell
        let currentOldFeeCreator = feeCreatorCells[currentCellIndex.item] as! FeeSelectorTableViewCell
        let currentNewFeeCreator = FeeSelector(label: currentOldFeeCreator.data!.label!, options: answer, type: currentOldFeeCreator.data!.type!)
        currentCell.data = currentNewFeeCreator
        
        if currentCellIndex.item == 3 {
            let nextIndexPath = IndexPath(row: currentCellIndex.item + 1, section: 0)
            let nextCell = tableView.cellForRow(at: nextIndexPath) as! FeeSelectorTableViewCell
            let nextOldFeeCreator = feeCreatorCells[nextIndexPath.item] as! FeeSelectorTableViewCell
            let nextNewFeeCreator = FeeSelector(label: nextOldFeeCreator.data!.label!, options: institutie[answer.first!.1], type: nextOldFeeCreator.data!.type!)
            nextCell.data = nextNewFeeCreator
        
            feeCreatorData.selectors![currentCellIndex.item - 1].options = institutie[answer.first!.1]!
        }
        
        tableView.reloadData()
    }
    
    func resetTable(){
        currentCellIndex = IndexPath(row: 0, section: 0)
        tableView.setContentOffset(.zero, animated: true)
        
        for cellIndex in 0..<feeCreatorCells.count{
            let cell = feeCreatorCells[cellIndex]
            switch cell{
                case is FeeTextFieldTableViewCell:
                    let textCell = cell as! FeeTextFieldTableViewCell
                    textCell.customTextField.text = nil
                    textCell.customTextField.placeholderColor = .black
                    textCell.customTextField.placeholder = textCell.data?.placeholder
                case is FeeSelectorTableViewCell:
                    let selectorCell = cell as! FeeSelectorTableViewCell
                
                    switch selectorCell.data?.type{
                        case .select:
                            let selector = feeCreatorCellsData[cellIndex] as! FeeSelector
                        
                            var feeSelector = FeeSelector()
                            switch cellIndex{
                            case 3:
                                feeSelector = FeeSelector(label: selectorCell.data!.label!, options: judete, type: selectorCell.data!.type!)
                            case 4:
                                feeSelector = FeeSelector(label: selectorCell.data!.label!, options: institutie["ALBA"], type: selectorCell.data!.type!)
                                feeCreatorData.selectors![cellIndex - 2].options = institutie["ALBA"]
                            default:
                                feeSelector = FeeSelector(label: selectorCell.data!.label!, options: selector.options, type: selectorCell.data!.type!)
                            }
                            selectorCell.data = feeSelector
                        case .date:
                            selectorCell.datePicker.date = Date()
                        case .image:
                            ()
                        case .none:
                            ()
                    }
                default:
                    ()
            }
        }
        
        tableView.reloadData()
        fee = Fee()
    }
}


