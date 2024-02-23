//
//  MockPostViewModel.swift
//  MobileAcebook
//
//  Created by AVJehoshua on 22/02/2024.
//

import Foundation

class MockPostsViewModel: ObservableObject {
    @Published var postsList: [Post] = []
    @Published var userDetails: User = User(username: "MockUser", password: "MockPassword", email: "Mock@email.com", avatar: nil)
    
    func findPost(byID id: String) -> Post? {
        return postsList.first(where: { $0.id == id })
    }
    
    func fetchPosts(token: String) {
        let mockPosts = [
            Post(id: "1", message: "Life is absurd", createdBy: "Mock user1", createdAt: "2024-02-20", comments: 0, likes: []),
            Post(id: "2", message: "So we should embrace it", createdBy: "Mock user2", createdAt: "2024-02-19", comments: 2, likes: ["user1", "user3"]),
            Post(id: "3", message: "Acebook > Facebook", createdBy: "Mock user1", createdAt: "2024-02-19", comments: 5, likes: []),
            Post(id: "4", message: "I love this app", createdBy: "Mock user1", createdAt: "2024-02-19", comments: 5, likes: []),
            Post(id: "5", message: "Lets talk about the politcal and economical state of the world", createdBy: "Mock user1", createdAt: "2024-02-19", comments: 5, likes: []),


        ]
        
        self.postsList = mockPosts
    }
    
    func getUserDetails(userCreatedBy: String, token: String, post_id: String) -> User {
        return userDetails
    }
}
