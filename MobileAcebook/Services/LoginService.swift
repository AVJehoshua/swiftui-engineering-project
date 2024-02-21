//
//  LoginService.swift
//  MobileAcebook
//
//  Created by Ilhan Abdalle on 19/02/2024.
//

import UIKit
import SwiftUI

struct UserData: Codable {

    let email: String
    let password: String
}

class LoginService {
    func login(_ user: UserData) -> Bool {
        @State var token = ""
        
        let url = URL(string: "http://127.0.0.1:8080/tokens")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let data = try! JSONEncoder().encode(user)
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
//      request has been copied here as it flagged an error for using the same variable name in an async func
        let requestData = request
        
        Task {
            do {
                let (tokenData, response) = try await URLSession.shared.data(for: requestData)
                let statusCode = (response as! HTTPURLResponse).statusCode
                
//              tokenData is returned an JSON object and the following code block extracts the token value
//              This translates the Json data to a dictionary
                guard let jsonToken = try? JSONSerialization.jsonObject(with: tokenData, options: []) as? [String: Any],
//                    the value for token is extracted from the dictionary by using the token key
                      let token = jsonToken["token"] as? String else {
                    print("Unable to decode token data from JSON or no token data received")
                    return }
                
                if statusCode == 201 {
                    print("OK: \(statusCode)")
                } else {
                    print("FAILURE: \(statusCode)")
                }
            } catch {
                print("Failed to Send POST Request \(error)")
            }
        }
        return true
    }
}
