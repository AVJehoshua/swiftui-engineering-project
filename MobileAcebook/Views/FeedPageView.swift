//
//  FeedPageView.swift
//  MobileAcebook
//
//  Created by Alan Gardiner on 20/02/2024.
//

import SwiftUI

struct FeedPageView: View {
//    @ObservedObject var viewModel = PostModel()

//    let mockPosts = MockDataService.getMockPosts()
    @ObservedObject var Posts = PostsViewModel()
    
    let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjVkNjEyNDU4MDdjZTc3ZjY4NDFmZjVmIiwiaWF0IjoxNzA4NjEwNjI1LCJleHAiOjE3MDg2MTEyMjV9.EEEP9P-McpMLsE_mfLFqIIJV7g1I6_TPVPf04ch5SFg"
    
    var body: some View {
        VStack{
            Text("Acebook")
                .font(.title)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .foregroundColor(.white)
            
            Spacer()
        
            // Comment
            Text("Create New Post")
            //All the posts in DB
            //Gets back JSON object that has "posts" : [array of posts objects]
            if Posts.postsList.isEmpty {
                Text("No posts")
            }else {
                List(Posts.postsList) {post in
                    PostView(post: post, postViewModel: PostsViewModel(), token: token)
                }.onAppear()
                
            }

        }
        .onAppear{
            Posts.fetchPosts(token: token )
        }
    }
}

#Preview {
    FeedPageView(Posts: PostsViewModel())
    
    
}
