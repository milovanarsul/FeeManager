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
            return ("Jude??", self.judet?.string ?? "")
        case 4:
            return ("Institu??ie", self.institutie?.string ?? "")
        case 5:
            return ("Serie proces verbal", self.serieProcesVerbal ?? "")
        case 6:
            return ("Num??r proces verbal", self.numarProcesVerbal ?? "")
        case 7:
            return ("Data ??ntocmirii procesului verbal", self.dataIntocmiriiProcesuluiVerbal ?? "")
        case 8:
            return ("Data comunic??rii procesului verbal", self.dataComunicariiProcesuluiVerbal ?? "")
        case 9:
            return ("Poza proces varbal", "Poza")
        case 10:
            return ("Explica??ie", self.explicatie ?? "")
        case 11:
            return ("Sum??", String(self.suma ?? 0))
        case 12:
            return ("CNP al persoanei care face plata", FirebaseFireStore.currentUserData.cnpAlPersoaneiCareFacePlata ?? "")
        case 13:
            return ("CNP al persoanei pentru care se face plata", self.cnpAlPersoaneiPentruCareSeFacePlata ?? "")
        case 14:
            return ("Nume ??i prenume", FirebaseFireStore.currentUserData.fullName ?? "")
        case 15:
            return ("Adres?? po??tal??", FirebaseFireStore.currentUserData.adresaPostala ?? "")
        case 16:
            return ("Email", FirebaseAuthentication.authentication.currentUser?.email ?? "")
        default:
            return ("", "")
        }
    }
    
    func editingFee(fee: Fee, editingIndex: Int){
        for index in 1...16{
            switch index{
            case 1:
                self.numeAmenda = fee.numeAmenda ?? FirebaseFireStore.fees[editingIndex].numeAmenda
            case 2:
                self.personType = fee.personType ?? FirebaseFireStore.fees[editingIndex].personType
            case 3:
                self.judet = fee.judet ?? FirebaseFireStore.fees[editingIndex].judet
            case 4:
                self.institutie = fee.institutie ?? FirebaseFireStore.fees[editingIndex].institutie
            case 5:
                self.serieProcesVerbal = fee.serieProcesVerbal ?? FirebaseFireStore.fees[editingIndex].serieProcesVerbal
            case 6:
                self.numarProcesVerbal = fee.numarProcesVerbal ?? FirebaseFireStore.fees[editingIndex].numarProcesVerbal
            case 7:
                self.dataIntocmiriiProcesuluiVerbal = fee.dataIntocmiriiProcesuluiVerbal ?? FirebaseFireStore.fees[editingIndex].dataIntocmiriiProcesuluiVerbal
            case 8:
                self.dataComunicariiProcesuluiVerbal = fee.dataComunicariiProcesuluiVerbal ?? FirebaseFireStore.fees[editingIndex].dataComunicariiProcesuluiVerbal
            case 9:
                self.pozaProcesVerbal = "Poza"
            case 10:
                self.explicatie = fee.explicatie ?? FirebaseFireStore.fees[editingIndex].explicatie
            case 11:
                self.suma = fee.suma ?? FirebaseFireStore.fees[editingIndex].suma
            case 12:
                self.cnpAlPersoaneiCareFacePlata = fee.cnpAlPersoaneiCareFacePlata ?? (FirebaseFireStore.fees[editingIndex].cnpAlPersoaneiCareFacePlata ?? FirebaseFireStore.currentUserData.cnpAlPersoaneiCareFacePlata)
            case 13:
                self.cnpAlPersoaneiPentruCareSeFacePlata = fee.cnpAlPersoaneiPentruCareSeFacePlata ?? FirebaseFireStore.fees[editingIndex].cnpAlPersoaneiPentruCareSeFacePlata
            case 14:
                self.numeSiPrenume = fee.numeSiPrenume ?? (FirebaseFireStore.fees[editingIndex].numeSiPrenume ?? FirebaseFireStore.currentUserData.fullName)
            case 15:
                self.adresaPostala = fee.adresaPostala ?? (FirebaseFireStore.fees[editingIndex].adresaPostala ?? FirebaseFireStore.currentUserData.adresaPostala)
            case 16:
                self.email = fee.email ?? (FirebaseFireStore.fees[editingIndex].email ?? FirebaseAuthentication.authentication.currentUser?.email)
            default:
                ()
            }
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

