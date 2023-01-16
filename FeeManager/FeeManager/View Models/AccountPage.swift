//
//  LoginPage.swift
//  FeeManager
//
//  Created by Milovan Arsul on 16.01.2023.
//

import Foundation
import UIKit

class AccountPage{
    var title: UITableViewCell
    var textFileds: [UITableViewCell]
    var helpText: UITableViewCell
    var action: UITableViewCell
    
    init(title: UITableViewCell, textFileds: [UITableViewCell], helpText: UITableViewCell, action: UITableViewCell) {
        self.title = title
        self.textFileds = textFileds
        self.helpText = helpText
        self.action = action
    }
}
