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
    
    let token = " "
    
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
