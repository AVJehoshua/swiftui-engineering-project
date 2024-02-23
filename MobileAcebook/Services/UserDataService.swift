//
//  UserDataService.swift
//  MobileAcebook
//
//  Created by Alan Gardiner on 22/02/2024.
//


import Foundation

class UserService {
    func getuser(email: String, completion: @escaping (User?) -> Void) {
        let url = URL(string: "http://127.0.0.1:8080/users/\(email)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            print(String(data: data, encoding: .utf8)!)
            do {
                let userResponse = try JSONDecoder().decode(UserResponse.self, from: data)
                
                let user = userResponse.user
                print("User data received and decoded")
                DispatchQueue.main.async {
                    completion(user)
                }
            } catch {
                print("Error decoding user: \(error)")
                completion(nil)
            }
        }.resume()
    }
}
