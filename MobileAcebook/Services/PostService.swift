//
//  PostService.swift
//  MobileAcebook
//
//  Created by Tom Mazzag on 20/02/2024.
//

import Foundation

class PostsViewModel: ObservableObject {
    @Published var postsList: [Post] = []
    
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
}
