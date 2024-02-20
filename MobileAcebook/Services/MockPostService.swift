//
//  SwiftUIView.swift
//  MobileAcebook
//
//  Created by Alan Gardiner on 20/02/2024.
//

import Foundation

struct MockPost: Identifiable, Codable{
    var id: String
    var message: String
    var comments: Int
}

//class MockDataService {
//    static func getMockPosts() -> [Post]{
//        return [
//            MockPost(id: "1", message: "New Post2", comments: 0),
//            MockPost(id: "2", message: "Some message", comments: 0),
//        ]
//    }
//}
//#Preview {
//    PostsViewModel()
//}
