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
    var text: String?
    
    init(smallPlaceHolderText: String? = nil, placeholder: String, image: String? = nil, type: UserDetails? = nil, text: String? = nil){
        if let smallPlaceHolderText = smallPlaceHolderText{
            self.smallPlaceHolderText = smallPlaceHolderText
        }
        
        self.placeholder = placeholder
        
        if let image = image{
            self.image = image
        }
        
        if let type = type {
            self.type = type
        }
        
        if let text = text {
            self.text = text
        }
    }
}
