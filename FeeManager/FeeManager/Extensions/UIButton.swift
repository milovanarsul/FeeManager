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
    
    func initialize(title: String, titleColor: UIColor, cornerRadius: CGFloat, font: UIFont, backgroundColor: UIColor, contentInsets: NSDirectionalEdgeInsets? = nil, image: UIImage? = nil, imagePlacement: NSDirectionalRectEdge? = nil, underline: Bool = false){
        
        var buttonAttributeContainer: AttributeContainer{
            var container = AttributeContainer()
            container.font = font
            container.foregroundColor = titleColor
            
            if underline{
                container.underlineStyle = .single
            }
            
            return container
        }
        
        var configuration = UIButton.Configuration.plain()
        configuration.title = title
        configuration.attributedTitle = AttributedString(title, attributes: buttonAttributeContainer)
        configuration.background.cornerRadius = cornerRadius
        configuration.background.backgroundColor = backgroundColor
        
        if let image = image {
            configuration.image = image
            configuration.image?.withTintColor(titleColor)
            configuration.imagePadding = 10
            
            if let imgPlacement = imagePlacement {
                configuration.imagePlacement = imgPlacement
            } else {
                configuration.imagePlacement = .leading
            }
        }
        
        if let contentInsets = contentInsets {
            configuration.contentInsets = contentInsets
        }
        
        self.configuration = configuration
        self.tintColor = titleColor
    }
    
    func underlineText() {
        guard let title = title(for: .normal) else { return }

        let titleString = NSMutableAttributedString(string: title)
        titleString.addAttribute(
          .underlineStyle,
          value: NSUnderlineStyle.single.rawValue,
          range: NSRange(location: 0, length: title.count)
        )
        setAttributedTitle(titleString, for: .normal)
      }
}
