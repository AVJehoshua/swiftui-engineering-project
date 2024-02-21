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
    
    let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjVkMzQ4MzcyNjJmYTQ0OGViZTY2ZmE2IiwiaWF0IjoxNzA4NTM5Mzc0LCJleHAiOjE3MDg1NDI5NzR9.JzkUp51iAIRtvHN_OzdbmTw9BtCtBNf2ssEGrFK1ECI"
    
    var body: some View {
        VStack(spacing:0){
            Text("Acebook")
                .font(.title)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .foregroundColor(.white)
            
//            Spacer()
        
            // Comment
            CreatePostView(token: token)        /*.scrollContentBackground(.hidden)*/
                .frame(maxHeight: 100)
//                .background(.red)
            
            //All the posts in DB
            //Gets back JSON object that has "posts" : [array of posts objects]
            if Posts.postsList.isEmpty {
                Text("No posts")
            }else {
                List(Posts.postsList) {post in
                    PostView(post: post, postViewModel: Posts, token: token)
                }.onAppear()
                
            }

        }
        .onAppear{
            _ = Posts.fetchPosts(token: token )
        }
    }
}

#Preview {
    FeedPageView()
}
