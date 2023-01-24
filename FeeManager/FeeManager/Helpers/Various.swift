//
//  Various.swift
//  FeeManager
//
//  Created by Milovan Arsul on 22.01.2023.
//

import Foundation

func formatDate(date: Date) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MM/dd/yyyy"
    return dateFormatter.string(from: date)
}

func convertToCGFloat(string: String) -> CGFloat{
    if let n = NumberFormatter().number(from: string){
        return CGFloat(truncating: n)
    }
    
    return 0
} 
