//
//  Data.swift
//  FeeManager
//
//  Created by Milovan Arsul on 15.01.2023.
//

import Foundation

let onboardingCards: [OnboardingCards] = [
    OnboardingCards(image: "onboarding1", mainLabel: "Salut!", secondaryLabel: "În următoarele momente îți vom prezenta Aplicația FeeManager"),
    OnboardingCards(image: "onboarding2", mainLabel: "Manageriază-ți amenzile", secondaryLabel: "Îți poți introduce amenzile direct în aplicație pentru a nu uita de ele"),
    OnboardingCards(image: "onboarding3", mainLabel: "Achită amenzile din aplicație", secondaryLabel: "Odată ce ai completat detaliile amenzii tale, poți face plata pe ghiseul.ro, direct din aplicație"),
    OnboardingCards(image: "onboarding4", mainLabel: "Date amănunțite", secondaryLabel: "Primește remindere în aplicație atunci când se apropie data plății. Vezi statistici referitoare la cheluielile tale"),
    OnboardingCards(image: "onboarding5", mainLabel: "Contul tău", secondaryLabel: "Ai nevoie de un cont pentru a putea folosi aplicația. Loghează-te sau înregistrează-te dacă nu ai deja un cont"),
]

let loginTextFieldsData: [CustomTextField] = [
    CustomTextField(smallPlaceHolderText: "Introdu adresa ta de e-mail", placeholder: "e-Mail", image: "envelope", type: .email),
    CustomTextField(smallPlaceHolderText: "Introdu parola", placeholder: "Parola", image: "key.horizontal", type: .password)
]
let loginPage = AccountPage(title: "Login", textFields: loginTextFieldsData, helpText: "Mi-am uitat parola", buttonText: "Login", accountAction: .login)

let signupTextFieldsData: [CustomTextField] = [
    CustomTextField(smallPlaceHolderText: "Introdu numele tău", placeholder: "Nume", image: "envelope", type: .name),
    CustomTextField(smallPlaceHolderText: "Introdu adresa ta de e-mail", placeholder: "e-Mail", image: "envelope", type: .email),
    CustomTextField(smallPlaceHolderText: "Introdu o nouă parolă", placeholder: "Parolă", image: "envelope", type: .password),
    CustomTextField(smallPlaceHolderText: "Reintrodu parola de mai sus", placeholder: "Verificare parolă", image: "envelope", type: .verifyPassword)
]

let signupPage = AccountPage(title: "Signup", textFields: signupTextFieldsData, helpText: "Toate câmpurile sunt obligatorii!", buttonText: "Signup", accountAction: .signup)
