//
//  UIView.swift
//  FeeManager
//
//  Created by Milovan Arsul on 12.01.2023.
//

import Foundation
import UIKit

extension UIView{
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat){
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
