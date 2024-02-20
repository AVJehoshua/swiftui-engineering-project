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
                    VStack(alignment: .leading){
                        Text(post.message)
                        Text("Comments: \(post.comments)")
                    }
                }
                
            }
            Button("click"){
                print(Posts.postsList)
            }
        }
        .onAppear{
            _ = Posts.fetchPosts(token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjVkNGEwYTdhMTdhODVmZGNlZWFmNTA3IiwiaWF0IjoxNzA4NDM5MzY4LCJleHAiOjE3MDg0NDI5Njh9.BkrBz4VAQyVlfGvNMda1FYbuCoqwC0X3OHipgN-kN7U")
        }
    }
}

#Preview {
    FeedPageView()
}
