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
    
    
    func signUpUser(user: User, completion: @escaping (Bool) -> Void) {
        // Check if email is valid
        guard isValidEmail(email: user.email) else {
            print("Invalid email")
            completion(false)
            return
        }
        // check if password is valid
        guard isValidPassword(password: user.password) else {
            print("Invalid password")
            completion(false)
            return
        }
        // if so, user can sign up
        authService.signUp(user: user) { success in
            if success {
                // If sign-up is successful, call the completion handler with true
                print("Signup successful")
                completion(true)
            } else {
                // If sign-up fails, call the completion handler with false
                print("Signup failed")
                completion(false)
            }
        }
    }
}
