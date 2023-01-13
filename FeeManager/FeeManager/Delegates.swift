//
//  Delegates.swift
//  FeeManager
//
//  Created by Milovan Arsul on 13.01.2023.
//

import Foundation
import UIKit

class Delegates{
    var navigationBar: NavigationBarDelegate! = nil
    
    init(){}
}

protocol NavigationBarDelegate{
    func goToPage(pageIndex: Int, direction: UIPageViewController.NavigationDirection)
}

let delegates: Delegates = Delegates()
