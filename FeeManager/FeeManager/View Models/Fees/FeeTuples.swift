//
//  FeeTuples.swift
//  FeeManager
//
//  Created by Milovan Arsul on 23.01.2023.
//

import Foundation

class FeeTuple: Codable{
    var integer: Int
    var string: String
    
    init(tuple: (Int, String)){
        self.integer = tuple.0
        self.string = tuple.1
    }
    
    func tuple() -> [(Int, String)]{
        return [(integer, string)]
    }
}
