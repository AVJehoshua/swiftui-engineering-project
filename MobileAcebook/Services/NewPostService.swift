//
//  NewPostService.swift
//  MobileAcebook
//
//  Created by Ilhan Abdalle on 21/02/2024.
//

import Foundation

struct NewPost: Codable {
    let message: String
}

class CreatePost {
    func createPost(newPost: NewPost, completion: @escaping (Bool) -> Void) {
        
        let url = URL(string: "http://127.0.0.1:8080/posts")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let data = try! JSONEncoder().encode(newPost)
        request.httpBody = data
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        //      request has been copied here as it flagged an error for using the same variable name in an async func
        let requestData = request
        
        Task {
            do {
                let (tokenData, response) = try await URLSession.shared.data(for: requestData)
                let statusCode = (response as! HTTPURLResponse).statusCode
                
                guard let jsonToken = try? JSONSerialization.jsonObject(with: tokenData, options: []) as? [String: Any],
                      let tokenValue = jsonToken["token"] as? String else {
                    print("Unable to decode token data from JSON or no token data received")
                    completion(false)
                    return
                }
                
                token = tokenValue
                if statusCode == 201 {
                    print("Post has been saved: \(statusCode)")
                    completion(true)
                } else {
                    print("FAILURE: \(statusCode)")
                    completion(false)
                }
            } catch {
                print("Failed to Send POST Request \(error)")
                completion(false)
            }
        }
        return
    }
}

