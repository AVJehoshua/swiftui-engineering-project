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
    
    let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjVkNDhmYmJlMGU3ZWMyMzRjMzc2ZTgxIiwiaWF0IjoxNzA4NTExMDMyLCJleHAiOjE3MDg1MTQ2MzJ9.Pwu86XR28vdhyaH_KjkakaVw5dSA47OAXWYe43T6Erg"
    
    var body: some View {
        VStack{
            Text("Acebook")
                .font(.title)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .foregroundColor(.white)
            
            Spacer()
        
            // Comment
            CreatePostView(token: token)
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
