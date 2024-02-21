//
//  PostView.swift
//  MobileAcebook
//
//  Created by Alan Gardiner on 20/02/2024.
//

import SwiftUI

struct PostView: View {
    let post: Post
    @ObservedObject var postViewModel: PostsViewModel
    let token: String
    
    var body: some View{
        VStack(alignment: .leading){
            
            Text(post.username ?? "loading...")
            Text(post.formattedCreatedAt)
                .foregroundStyle(Color.gray)
            Text(post.message)
            Text("Comments: \(post.comments)")
            
        }
        .onAppear{
            _ = postViewModel.getUserDetails(userCreatedBy: post.createdBy, token: token, post_id: post.id )
        }
    }
    
}

//#Preview {
//    PostView(post: Post(id: "1", message: "Example Post", comments: 1))
//}
