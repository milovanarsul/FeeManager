//
//  UITableView.swift
//  FeeManager
//
//  Created by Milovan Arsul on 23.01.2023.
//

import Foundation
import UIKit

extension UITableView{
    func getAllCells() -> [UITableViewCell] {
        var cells = [UITableViewCell]()
        for i in 0..<self.numberOfSections
        {
            for j in 0..<self.numberOfRows(inSection: i)
            {
                if let cell = self.cellForRow(at: IndexPath(row: j, section: i)) {
                    cells.append(cell)
                }
                
            }
        }
        return cells
    }
}
