//
//  AuthenticationService.swift
//  MobileAcebook
//
//  Created by Josué Estévez Fernández on 01/10/2023.
//

import Foundation

class AuthenticationService: AuthenticationServiceProtocol {
    func signUp(user: User, completion: @escaping (Bool) -> Void) {
        print("Auth service reached")
        guard let signUpURL = URL(string: "http://localhost:8080/users") else {
            completion(false)
            return
        }
        
        var request = URLRequest(url: signUpURL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let userData = try JSONEncoder().encode(user)
            request.httpBody = userData
        } catch {
            print("Error encoding user data: \(error)")
            completion(false)
            return
        }
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 201 else {
                print("Error: Invalid response")
                completion(false)
                return
            }
            
            if let error = error {
                print("Error making network request: \(error)")
                completion(false)
                return
            }
            
            completion(true)
        }
        
        task.resume()
    }
}
