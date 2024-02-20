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
    
    let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjVkNGEwYTdhMTdhODVmZGNlZWFmNTA3IiwiaWF0IjoxNzA4NDQzMzQ4LCJleHAiOjE3MDg0NDY5NDh9.W95KpcrbnKtYEfVmyrlC1tGGVHbifBRGRuWHILLFgAc"
    
    var body: some View {
        VStack{
        Text("Acebook").font(.title).frame(width: nil, height: nil).background(.red)
        
        // Comment
                Text("Create New Post")
        //All the posts in DB
        //Gets back JSON object that has "posts" : [array of posts objects]
            if Posts.postsList.isEmpty {
                Text("No posts")
            }else {
                List(Posts.postsList) {post in
                    PostView(post: post, postViewModel: Posts)
                }.onAppear()
                
            }
            Button("click"){
                print(Posts.postsList)
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
