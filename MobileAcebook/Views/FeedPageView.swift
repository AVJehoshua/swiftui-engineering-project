//
//  FeedPageView.swift
//  MobileAcebook
//
//  Created by Alan Gardiner on 20/02/2024.
//

import SwiftUI

struct FeedPageView: View {
//    @ObservedObject var viewModel = PostModel()

    let mockPosts = MockDataService.getMockPosts()
    
    var body: some View {
        VStack{
        Text("Acebook").font(.title).frame(width: nil, height: nil).background(.red)
        
        // Comment
                Text("Create New Post")
        //All the posts in DB
        //Gets back JSON object that has "posts" : [array of posts objects]
            List(mockPosts) {post in
                MockPostView(post: post)
            }
        }
    }
}

#Preview {
    FeedPageView()
}
