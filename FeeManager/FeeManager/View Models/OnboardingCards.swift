//
//  OnboardingCards.swift
//  FeeManager
//
//  Created by Milovan Arsul on 15.01.2023.
//

import Foundation

class OnboardingCards{
    var image: String
    var mainLabel: String
    var secondaryLabel: String?
    
    init(image: String, mainLabel: String, secondaryLabel: String? = nil){
        self.image = image
        self.mainLabel = mainLabel
        
        if let secondaryLabel = secondaryLabel{
            self.secondaryLabel = secondaryLabel
        }
    }
}
