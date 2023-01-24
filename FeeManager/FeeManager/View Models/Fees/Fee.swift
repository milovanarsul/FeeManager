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
    
    func attributesStringArray(index: Int) -> (String?, String?){
        switch index{
        case 1:
            return ("", self.numeAmenda ?? "")
        case 2:
            return ("Tipul persoanei", self.personType?.string ?? "")
        case 3:
            return ("Județ", self.judet?.string ?? "")
        case 4:
            return ("Instituție", self.institutie?.string ?? "")
        case 5:
            return ("Serie proces verbal", self.serieProcesVerbal ?? "")
        case 6:
            return ("Număr proces verbal", self.numarProcesVerbal ?? "")
        case 7:
            return ("Data întocmirii procesului verbal", self.dataIntocmiriiProcesuluiVerbal ?? "")
        case 8:
            return ("Data comunicării procesului verbal", self.dataComunicariiProcesuluiVerbal ?? "")
        case 9:
            return ("Poza proces varbal", "Poza")
        case 10:
            return ("Explicați", self.explicatie ?? "")
        case 11:
            return ("Sumă", String(self.suma ?? 0))
        case 12:
            return ("CNP al persoanei care face plata", self.cnpAlPersoaneiCareFacePlata ?? "")
        case 13:
            return ("CNP al persoanei pentru care se face plata", self.cnpAlPersoaneiPentruCareSeFacePlata ?? "")
        case 14:
            return ("Nume și prenume", FirebaseFireStore.currentUserData.fullName ?? "")
        case 15:
            return ("Adresă poștală", FirebaseFireStore.currentUserData.adresaPostala ?? "")
        case 16:
            return ("Email", FirebaseAuthentication.authentication.currentUser?.email ?? "")
        default:
            return ("", "")
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

