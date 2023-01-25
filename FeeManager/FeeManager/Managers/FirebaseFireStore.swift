//
//  FirebaseFireStore.swift
//  FeeManager
//
//  Created by Milovan Arsul on 23.01.2023.
//

import Foundation
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

class FirebaseFireStore{
    static let store = FirebaseAuthentication.database.collection("user").document(FirebaseAuthentication.userID!)
    static let feeStore = store.collection("fees")
    static var currentUserData = User()
    static var feeCount: Int?
    static var fees = [Fee]()
    
    ///ADD USER DATA
    
    static func addDetailsToUser(userDetails: User){
        do {
            try store.setData(from: userDetails)
        } catch let error {
            print("Error writing userDetails to Firestore: \(error)")
        }
    }
    
    static func addFeeToUser(fee: Fee, index: Int? = nil){
        do {
            if let index = index {
                try feeStore.document("fee\(index)").setData(from: fee)
                fees[index] = fee
            } else {
                feeCount! += 1
                try feeStore.document("fee\(feeCount!)").setData(from: fee)
                store.updateData(["feeCount" : feeCount!])
                fees.append(fee)
            }
        } catch let error {
            print("Error writing fee to Firestore: \(error)")
        }
    }
    
    ///GET USER DATA
    
    static func getUserData(completion: @escaping (_ finished: Bool) -> Void){
        store.getDocument(as: User.self) { result in
            switch result {
            case .success(let success):
                currentUserData = success
                feeCount = currentUserData.feeCount
                completion(true)
            case .failure(let failure):
                print("Error decoding: \(failure)")
                completion(false)
            }
        }
    }
    
    static func getFees(completion:  @escaping (_ finished: Bool) -> Void){
        getUserData(completion: {finished in
            if finished{
                feeStore.getDocuments(){ (querySnapshot, err) in
                    if let err = err{
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents{
                            do {
                                try fees.append(document.data(as: Fee.self))
                            } catch let error {
                                print("Error decoding fee: \(error)")
                            }
                        }
                    }
                    completion(true)
                }
            }
        })
    }
    
    ///DELETE DOCUMENTS
    
    static func deleteFee(){
        for index in 0...feeCount!{
            feeStore.document("fee\(index)").delete(){ err in
                if let err = err {
                    print("Error removing document: \(err)")
                }
            }
        }
        currentUserData.feeCount = -1
        addDetailsToUser(userDetails: currentUserData)
        
        for index in 0..<fees.count{
            addFeeToUser(fee: fees[index], index: index)
        }
    }
    
    static func clearData(){
        FirebaseAuthentication.userID = nil
        currentUserData = User()
        feeCount = nil
        fees = [Fee]()
    }
}
