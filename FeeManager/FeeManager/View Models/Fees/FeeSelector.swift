//
//  FeeSelector.swift
//  FeeManager
//
//  Created by Milovan Arsul on 21.01.2023.
//

import Foundation

class FeeSelector{
    var label: String?
    var options: [(Int, String)]?
    var type: FeeSelectorType?
    
    init(label: String, options: [(Int, String)]? = nil, type: FeeSelectorType) {
        self.label = label
        self.type = type
        
        if let options = options{
            self.options = options
        }
    }
    
    init(){}
}

