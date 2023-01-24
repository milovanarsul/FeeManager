//
//  FeeCreator.swift
//  FeeManager
//
//  Created by Milovan Arsul on 21.01.2023.
//

import Foundation
import UIKit

class FeeCreator{
    let feeTitleTableViewCell = FeeTitleTableViewCell()
    var feeSelectorTableViewCell = FeeSelectorTableViewCell()
    var feeTextFieldsTableViewCell = FeeTextFieldTableViewCell()
    var feeActionTableViewCell = FeeActionTableViewCell()
    
    var selectors: [FeeSelector]?
    var fields: [CustomTextField]?
    
    init(titleAction: FeeAction, selectors: [FeeSelector], fields: [CustomTextField]){
        self.selectors = selectors
        self.fields = fields
        
        feeTitleTableViewCell.setup(feeAction: titleAction)
        feeCreatorCellsData.append(titleAction)
        feeCreatorCells.append(feeTitleTableViewCell)
        
        feeTextFieldsTableViewCell.setup(data: fields[0], currentFieldIndex: 0)
        feeCreatorCells.append(feeTextFieldsTableViewCell)
        feeCreatorCellsData.append(fields[0])
        feeTextFieldsTableViewCell = FeeTextFieldTableViewCell()
        
        for selector in 0...2 {
            feeSelectorTableViewCell.setup(data: selectors[selector], currentIndex: selector + 1)
            feeCreatorCells.append(feeSelectorTableViewCell)
            feeCreatorCellsData.append(selectors[selector])
            feeSelectorTableViewCell = FeeSelectorTableViewCell()
        }
        
        for field in 1...2{
            feeTextFieldsTableViewCell.setup(data: fields[field], currentFieldIndex: field + 3)
            feeCreatorCells.append(feeTextFieldsTableViewCell)
            feeCreatorCellsData.append(fields[field])
            feeTextFieldsTableViewCell = FeeTextFieldTableViewCell()
        }
        
        for selector in 3...5{
            feeSelectorTableViewCell.setup(data: selectors[selector], currentIndex: selector + 2)
            feeCreatorCells.append(feeSelectorTableViewCell)
            feeCreatorCellsData.append(selectors[selector])
            feeSelectorTableViewCell = FeeSelectorTableViewCell()
        }
        
        for field in 3..<fields.count{
            feeTextFieldsTableViewCell.setup(data: fields[field], currentFieldIndex: field + 6)
            feeCreatorCells.append(feeTextFieldsTableViewCell)
            feeCreatorCellsData.append(fields[field])
            feeTextFieldsTableViewCell = FeeTextFieldTableViewCell()
        }
        
        feeActionTableViewCell.setup()
        feeCreatorCells.append(feeActionTableViewCell)
    }
    
    init(){}
}

var feeCreatorCells: [UITableViewCell] = []
var feeCreatorCellsData : [Any] = []


