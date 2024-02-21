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
    
    let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjVkMzQ4MzcyNjJmYTQ0OGViZTY2ZmE2IiwiaWF0IjoxNzA4NTQ5NzI2LCJleHAiOjE3MDg1NTMzMjZ9.AN1Z0GLSsh1VPqnNaVgGeF6VA2JSgSjcriyFrqcUysk"
    
    var body: some View {
        VStack(spacing:0){
            Text("Acebook")
                .font(.title)
                .frame(maxWidth: .infinity)
                .background(.blue)
                .foregroundColor(.white)
            
//            Spacer()
//            Form{
            CreatePostView(token: token)
//                .frame(maxWidth: 300, maxHeight: 80)
                .padding(25)
//            }
//            .scrollContentBackground(.hidden)
//            .frame(maxHeight: 100)
//            .background(.red)
            
                //All the posts in DB
                //Gets back JSON object that has "posts" : [array of posts objects]
                if Posts.postsList.isEmpty {
                    Text("No posts")
                }else {
                    List(Posts.postsList) {post in
                        PostView(post: post, postViewModel: Posts, token: token)
                    }
//                    .listStyle(PlainListStyle())
                    .onAppear()
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
