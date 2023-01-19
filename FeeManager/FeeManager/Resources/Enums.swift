//
//  Enums.swift
//  FeeManager
//
//  Created by Milovan Arsul on 13.01.2023.
//

import Foundation
import UIKit

enum AnimationDirection{
    case forwards
    case backwards
}

enum AccountAction{
    case login
    case signup
}

enum FieldType{
    case title
    case text
    case helpText
    case action
}

enum UserDetails{
    case email
    case password
    case verifyPassword
    case name
}

enum AnimationType{
    case show
    case hide
}
