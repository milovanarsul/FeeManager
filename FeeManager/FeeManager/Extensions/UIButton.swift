//
//  UIButton.swift
//  FeeManager
//
//  Created by Milovan Arsul on 12.01.2023.
//

import Foundation
import UIKit

extension UIButton{
    func initializeIcon(image: UIImage? = nil, backgroundImage: UIImage? = nil,  backgroundColor: UIColor? = .clear, contentInsets: NSDirectionalEdgeInsets? = nil, tintColour: UIColor? = nil){
        var configuration = UIButton.Configuration.plain()
        
        if let backgroundImage = backgroundImage {
            configuration.background.image = backgroundImage
            configuration.background.imageContentMode = .scaleAspectFit
        }
        
        if let image = image {
            configuration.image = image
            configuration.image?.withTintColor(.black)
            configuration.imagePadding = 10
            configuration.imagePlacement = .leading
            
        }
        
        if let backgroundColor = backgroundColor {
            configuration.background.backgroundColor = backgroundColor
        }
        
        if let contentInsets = contentInsets {
            configuration.contentInsets = contentInsets
        }
        
        self.configuration = configuration
        
        if let tintColour = tintColour{
            self.tintColor = tintColour
        } else {
            self.tintColor = .black
        }
    }
}
