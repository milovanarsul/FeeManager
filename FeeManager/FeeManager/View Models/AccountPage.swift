//
//  LoginPage.swift
//  FeeManager
//
//  Created by Milovan Arsul on 16.01.2023.
//

import Foundation
import UIKit

class AccountPage{
    let accountHeaderTableViewCell = AccountHeaderTableViewCell()
    var accountFieldsTableViewCell = AccountFieldsTableViewCell()
    let accountHelperTextTableViewCell = AccountHelperTextTableViewCell()
    let accountActionButtonTableViewCell = AccountActionButtonTableViewCell()
    
    var accountFieldsTableViewCells = [AccountFieldsTableViewCell]()
    
    init(title: String, textFields: [CustomTextField], helpText: String, buttonText: String, accountAction: AccountAction){
        accountHeaderTableViewCell.setup(text: title)
        
        for textFiled in textFields{
            accountFieldsTableViewCell.setup(data: textFiled)
            accountFieldsTableViewCells.append(accountFieldsTableViewCell)
            accountFieldsTableViewCell = AccountFieldsTableViewCell()
        }
        
        accountHelperTextTableViewCell.setup(text: helpText)
        accountActionButtonTableViewCell.setup(text: buttonText, accountAction: accountAction)
    }
}
