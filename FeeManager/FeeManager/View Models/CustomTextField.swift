//
//  CustomTextField.swift
//  FeeManager
//
//  Created by Milovan Arsul on 16.01.2023.
//

import Foundation

class CustomTextField{
    var smallPlaceHolderText: String?
    var placeholder: String?
    var image: String?
    var type: UserDetails?
    
    init(smallPlaceHolderText: String, placeholder: String, image: String, type: UserDetails) {
        self.smallPlaceHolderText = smallPlaceHolderText
        self.placeholder = placeholder
        self.image = image
        self.type = type
    }
}
