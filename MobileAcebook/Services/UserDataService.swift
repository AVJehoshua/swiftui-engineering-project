//
//  UserDataService.swift
//  MobileAcebook
//
//  Created by Alan Gardiner on 22/02/2024.
//

let email: String = "test@test.com"

import Foundation

class UserService{
    func getuser(email: String) {
        let url = URL(string: "http://127.0.0.1:8080/\(email)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let response = try JSONDecoder().decode(PostWrapper.self, from: data)
                DispatchQueue.main.async {
                    
                }
            } catch {
                print("Error decoding posts: \(error)")
            }
        }.resume()
        
        return
    }
}

