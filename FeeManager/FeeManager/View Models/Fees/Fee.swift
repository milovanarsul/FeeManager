//
//  Fee.swift
//  FeeManager
//
//  Created by Milovan Arsul on 20.01.2023.
//

import Foundation

class Fee: Codable{
    var numeAmenda: String?
    var personType: FeeTuple?
    var judet: FeeTuple?
    var institutie: FeeTuple?
    var serieProcesVerbal: String?
    var numarProcesVerbal: String?
    var dataIntocmiriiProcesuluiVerbal: String?
    var dataComunicariiProcesuluiVerbal: String?
    var pozaProcesVerbal: String?
    var explicatie: String?
    var suma: Double?
    var cnpAlPersoaneiCareFacePlata: String?
    var cnpAlPersoaneiPentruCareSeFacePlata: String?
    var numeSiPrenume: String?
    var adresaPostala: String?
    var email: String?
    
    init(nume: String? = nil, personType: FeeTuple? = nil, judet: FeeTuple? = nil, institutie: FeeTuple? = nil, serieProcesVerbal: String? = nil, numarProcesVerbal: String? = nil, dataIntocmiriiProcesuluiVerbal: String? = nil, dataComunicariiProcesuluiVerbal: String? = nil, poze: String? = nil, pozaProcesVerbal: String? = nil, explicatie: String? = nil, suma: Double? = nil, cnpAlPersoaneiCareFacePlata: String? = nil, cnpAlPersoaneiPentruCareSeFacePlata: String? = nil, numeSiPrenume: String? = nil, adresaPostala: String? = nil, email: String? = nil) {
        self.numeAmenda = nume
        self.personType = personType
        self.judet = judet
        self.institutie = institutie
        self.serieProcesVerbal = serieProcesVerbal
        self.numarProcesVerbal = numarProcesVerbal
        self.dataIntocmiriiProcesuluiVerbal = dataIntocmiriiProcesuluiVerbal
        self.dataComunicariiProcesuluiVerbal = dataComunicariiProcesuluiVerbal
        self.pozaProcesVerbal = pozaProcesVerbal
        self.explicatie = explicatie
        self.suma = suma
        self.cnpAlPersoaneiCareFacePlata = cnpAlPersoaneiCareFacePlata
        self.cnpAlPersoaneiPentruCareSeFacePlata = cnpAlPersoaneiPentruCareSeFacePlata
        self.numeSiPrenume = numeSiPrenume
        self.adresaPostala = adresaPostala
        self.email = email
    }
    
    func print(){
        Swift.print("\(String(describing: self.numeAmenda)), \(String(describing: self.personType)), \(String(describing: self.judet)), \(String(describing: self.institutie)), \(String(describing: self.serieProcesVerbal)), \(String(describing: self.numarProcesVerbal)), \(String(describing: self.dataIntocmiriiProcesuluiVerbal)), \(String(describing: self.dataComunicariiProcesuluiVerbal)), \(String(describing: self.pozaProcesVerbal)), \(String(describing: self.explicatie)), \(String(describing: self.suma)), \(String(describing: self.cnpAlPersoaneiCareFacePlata)), \(String(describing: self.cnpAlPersoaneiPentruCareSeFacePlata)), \(String(describing: self.numeSiPrenume)), \(String(describing: self.adresaPostala)), \(String(describing: self.email))")
    }
    
    func beautify(){
        if personType == nil {
            personType = FeeTuple(tuple: tipulPersoanei[0])
        }
        
        if judet == nil {
            judet = FeeTuple(tuple: judete[0])
        }
        
        if institutie == nil && judet != nil {
            let tuple = FeeManager.institutie[judet!.string]!.first
            institutie = FeeTuple(tuple: tuple!)
        }
        
        if institutie == nil && judet == nil {
            let tuple = FeeManager.institutie[judete[0].1]!.first
            institutie = FeeTuple(tuple: tuple!)
        }
        
        if dataIntocmiriiProcesuluiVerbal == nil {
            dataIntocmiriiProcesuluiVerbal = formatDate(date: Date())
        }
        
        if dataComunicariiProcesuluiVerbal == nil {
            dataComunicariiProcesuluiVerbal = formatDate(date: Date())
        }
    }
}

var fee = Fee()
func appendFee(answer: Any, index: Int){
    switch index{
    case 1:
        fee.numeAmenda = answer as? String
    case 2:
        fee.personType = FeeTuple(tuple: answer as! (Int, String))
    case 3:
        fee.judet = FeeTuple(tuple: answer as! (Int, String))
    case 4:
        fee.institutie = FeeTuple(tuple: answer as! (Int, String))
    case 5:
        fee.serieProcesVerbal = answer as? String
    case 6:
        fee.numarProcesVerbal = answer as? String
    case 7:
        fee.dataIntocmiriiProcesuluiVerbal = answer as? String
    case 8:
        fee.dataComunicariiProcesuluiVerbal = answer as? String
    case 9:
        fee.pozaProcesVerbal = answer as? String
    case 10:
        fee.explicatie = answer as? String
    case 11:
        fee.suma = Double(answer as! String)
    case 12:
        fee.cnpAlPersoaneiCareFacePlata = answer as? String
    case 13:
        fee.cnpAlPersoaneiPentruCareSeFacePlata = answer as? String
    case 14:
        fee.numeSiPrenume = answer as? String
    case 15:
        fee.adresaPostala = answer as? String
    case 16:
        fee.email = answer as? String
    default:
        ()
    }
}

