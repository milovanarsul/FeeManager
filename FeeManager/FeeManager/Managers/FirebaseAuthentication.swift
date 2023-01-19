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
    static let database = Firestore.firestore()
    
    static func signupUser(fullName: String, email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password){ (result, error) in
            if error != nil{
                delegates.onboardingViewController.displayErrorView(error: error!.localizedDescription)
                delegates.onboardingViewController.animateErrorView(type: .show)
            } else {
                database.collection("users").addDocument(data: ["fullname" : fullName,  "uid" : result!.user.uid]) {(error) in
                    if error != nil {
                        delegates.onboardingViewController.displayErrorView(error: error!.localizedDescription)
                        delegates.onboardingViewController.animateErrorView(type: .show)
                    }
                    
                    FeeManager.fullName = nil
                    FeeManager.email = nil
                    FeeManager.password = nil
                    
                    delegates.onboardingViewController.endOnboarding()
                    print(delegates.onboarding.getCurrentIndex())
                    delegates.onboarding.goToPage(pageIndex: delegates.onboarding.getCurrentIndex() + 2, direction: .forward)
                }
            }
        }
    }
    
    static func loginUser(email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password) {(result, error) in
            if error != nil {
                delegates.onboardingViewController.displayErrorView(error: error!.localizedDescription)
                delegates.onboardingViewController.animateErrorView(type: .show)
            } else {
                FeeManager.email = nil
                FeeManager.password = nil
                
                delegates.onboardingViewController.endOnboarding()
                delegates.onboarding.goToPage(pageIndex: delegates.onboarding.getCurrentIndex() + 2, direction: .forward)
            }
        }
    }
}
