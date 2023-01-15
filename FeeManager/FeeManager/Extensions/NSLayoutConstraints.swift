//
//  NSLayoutConstraints.swift
//  FeeManager
//
//  Created by Milovan Arsul on 15.01.2023.
//

import Foundation
import UIKit

extension NSLayoutConstraint{
    func changeConstraint(parentView: UIView, oldConstraint: inout NSLayoutConstraint, newConstraint: NSLayoutConstraint){
        parentView.removeConstraint(oldConstraint)
        parentView.addConstraint(newConstraint)
        
        /*
        oldConstraint.isActive = false
        oldConstraint = newConstraint
        oldConstraint.isActive = true
        */
        
        
    }
}
