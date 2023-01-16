//
//  UIStackView.swift
//  FeeManager
//
//  Created by Milovan Arsul on 15.01.2023.
//

import Foundation
import UIKit

extension UIStackView{
    func initalize(axis: NSLayoutConstraint.Axis, alignment: UIStackView.Alignment, distribution: UIStackView.Distribution, spacing: CGFloat){
        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
    }
    
    func addAranagedSubviews(views: [UIView]){
        for view in views{
            addArrangedSubview(view)
        }
    }
}
