//
//  SwiftUIView.swift
//  MobileAcebook
//
//  Created by Alan Gardiner on 20/02/2024.
//

import Foundation

struct Post: Identifiable, Codable{
    var id: String
    var message: String
    var comments: Int
}

class MockDataService {
    static func getMockPosts() -> [Post]{
        return [
            Post(id: "1", message: "New Post2", comments: 0),
            Post(id: "2", message: "Some message", comments: 0),
        ]
    }
}
//#Preview {
//    PostsViewModel()
//}
