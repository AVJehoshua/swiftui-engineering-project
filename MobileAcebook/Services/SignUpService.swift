//
//  SignUpService.swift
//  MobileAcebook
//
//  Created by AVJehoshua on 20/02/2024.
//

import Foundation

class SignUp {
    
    let authService = AuthenticationService()
    
    func isValidEmail(email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        // Create NSPredicate with format matching the regex
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        
        // Evaluate the predicate with the email string
        return emailPredicate.evaluate(with: email)
}
    
    
    func isValidPassword(password: String) -> Bool {
        let minLength = 8
        let containsUppercase = password.rangeOfCharacter(from: .uppercaseLetters) != nil
        let containsLowercase = password.rangeOfCharacter(from: .lowercaseLetters) != nil
        let containsSpecialCharacter = password.rangeOfCharacter(from: .punctuationCharacters) != nil
        
        return password.count >= minLength &&
            containsUppercase &&
            containsLowercase &&
            containsSpecialCharacter
    }


    func signUpUser(user: User) -> Bool {
        // check if email is valid
        guard isValidEmail(email: user.email) else {
            print("Invalid email")
            return false
        }
        // check if password is valid
        guard isValidPassword(password: user.password) else {
            print("Invalid password")
            return false
                }
        
        // if so, user can sign up
        var signedUp = false
        authService.signUp(user: user) { success in
            if  success {
                signedUp = true
                print("user signup status:", signedUp)
                print("Signup successful")
                
            } else {
                print("Signup failed")
            }
        }
        return signedUp
    }
}
