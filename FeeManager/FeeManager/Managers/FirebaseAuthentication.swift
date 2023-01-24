//
//  FirebaseAuthentication.swift
//  FeeManager
//
//  Created by Milovan Arsul on 15.01.2023.
//

import Foundation
import FirebaseCore
import FirebaseAuth
import FirebaseFirestore

class FirebaseAuthentication{
    static let authentication = Auth.auth()
    static let database = Firestore.firestore()
    static var userID: String?
    
    static func signupUser(fullName: String, email: String, password: String){
        authentication.createUser(withEmail: email, password: password){ (result, error) in
            if error != nil{
                delegates.onboardingViewController.displayErrorView(error: error!.localizedDescription)
                delegates.onboardingViewController.animateErrorView(type: .show)
            } else {
                do {
                    let details = User(fullName: fullName, uid: result!.user.uid)
                
                    try database.collection("user").document(result!.user.uid).setData(from: details)
                    userID = result!.user.uid
                    
                    FeeManager.fullName = nil
                    FeeManager.email = nil
                    FeeManager.password = nil
                    
                    FirebaseFireStore.getUserData(completion: {finished in
                        if finished{
                            delegates.onboardingViewController.endOnboarding()
                            delegates.onboarding.goToPage(pageIndex: delegates.onboarding.getCurrentIndex() + 2, direction: .forward)
                            defaults.set(true, forKey: "notFirstLaunch")
                        }
                    })
                } catch let error {
                    print("Error writing details to Firestore: \(error)")
                    delegates.onboardingViewController.displayErrorView(error: error.localizedDescription)
                    delegates.onboardingViewController.animateErrorView(type: .show)
                }
            }
        }
    }
    
    static func loginUser(email: String, password: String){
        authentication.signIn(withEmail: email, password: password) {(result, error) in
            if error != nil {
                delegates.onboardingViewController.displayErrorView(error: error!.localizedDescription)
                delegates.onboardingViewController.animateErrorView(type: .show)
            } else {
                userID = result!.user.uid
                
                FeeManager.email = nil
                FeeManager.password = nil
                
                FirebaseFireStore.getFees(completion: {finished in
                    if finished{
                        delegates.onboardingViewController.endOnboarding()
                        delegates.onboarding.goToPage(pageIndex: delegates.onboarding.getCurrentIndex() + 2, direction: .forward)
                        defaults.set(true, forKey: "notFirstLaunch")
                    }
                })
            }
        }
    }
    
    static func getCurrentUserID(){
        userID = authentication.currentUser?.uid
    }
}
