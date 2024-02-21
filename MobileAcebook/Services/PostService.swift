//
//  PostService.swift
//  MobileAcebook
//
//  Created by Tom Mazzag on 20/02/2024.
//

import Foundation

class PostsViewModel: ObservableObject {
    @Published var postsList: [Post] = []
    @Published var userDetails: User = User(username: "", password: "", email: "")
    
    func findPost(byID id: String) -> Post? {
        return postsList.first(where: { $0.id == id })
    }
    
    func fetchPosts(token: String) -> String{
        let url = URL(string: "http://127.0.0.1:8080/posts")!
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let response = try JSONDecoder().decode(PostWrapper.self, from: data)
                DispatchQueue.main.async {
                    self.postsList = response.posts
                }
            } catch {
                print("Error decoding posts: \(error)")
            }
        }.resume()
        
        return ""
    }
    
    func getUserDetails(userCreatedBy: String, token: String, post_id: String) -> User {
        let url = URL(string: "http://127.0.0.1:8080/posts/\(userCreatedBy)")!

        var postToUpdate = findPost(byID: post_id)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")

        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else { return }
            
            do {
                let response = try JSONDecoder().decode(UserWrapper.self, from: data)
                DispatchQueue.main.async {
                    self.userDetails = response.ownerData
                    postToUpdate.username = self.userDetails.username
                    if let index = self.postsList.firstIndex(where: { $0.id == post_id }) {
                        self.postsList[index] = postToUpdate
                    }
                }
            } catch {
                print("Error decoding posts: \(error)")
            }
        }.resume()
        
    
        
        print(self.userDetails.username)
        
        return self.userDetails
    }
}

