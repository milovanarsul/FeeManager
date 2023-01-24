//
//  User.swift
//  FeeManager
//
//  Created by Milovan Arsul on 23.01.2023.
//

import Foundation

class User: Codable{
    var fullName: String?
    var personType: FeeTuple?
    var adresaPostala: String?
    var cnpAlPersoaneiCareFacePlata: String?
    var feeCount: Int?
    var uid: String?
    
    init(personType: FeeTuple, adresaPostala: String, cnpAlPersoaneiCareFacePlata: String){
        self.personType = personType
        self.adresaPostala = adresaPostala
        self.cnpAlPersoaneiCareFacePlata = cnpAlPersoaneiCareFacePlata
    }
    
    init(fullName: String, uid: String){
        self.fullName = fullName
        self.personType = nil
        self.adresaPostala = nil
        self.cnpAlPersoaneiCareFacePlata = nil
        self.feeCount = -1
        self.uid = uid
    }
    
    init(){}
    
    func hasDetails() -> Bool{
        if personType == nil && adresaPostala == nil && cnpAlPersoaneiCareFacePlata == nil{
            return false
        }
        
        return true
    }
    
    func userToArray() -> [(String, String)]{
        var array = [(String, String)]()
        array.append(("Nume", self.fullName ?? ""))
        array.append(("Tipul persoanei", self.personType?.string ?? ""))
        array.append(("Adresa postala", self.adresaPostala ?? ""))
        array.append(("CNP", self.cnpAlPersoaneiCareFacePlata ?? ""))
        
        return array
    }
}
