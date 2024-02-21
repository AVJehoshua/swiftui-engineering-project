//
//  SignUp.swift
//  MobileAcebook
//
//  Created by AVJehoshua on 19/02/2024.
//

import Foundation

class SignUp {
    
    
let authService = AuthenticationService()
//    let user = User(username: "Test username", password: "Test password", email: "Test email")


    func isValidEmail(email: String) -> Bool {
    // Regular expression pattern for validating email addresses
    let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    
    // Create NSPredicate with format matching the regex
    let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
    
    // Evaluate the predicate with the email string
    return emailPredicate.evaluate(with: email)
}




    func signUpUser(user: User) {
        authService.signUp(user: user) { success in
            if success {
                print("Signup successful")
                // Perform any additional actions after successful signup
            } else {
                print("Signup failed")
                // Handle signup failure
            }
        }
    }
    
}




