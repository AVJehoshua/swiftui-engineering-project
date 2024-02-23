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
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 40, height: 40)
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(post.username ?? "Test User")
                        .font(.headline)
                    Text(post.formattedCreatedAt)
                        .font(.caption)
                        .foregroundColor(.gray)
                }
                
                Spacer()
            }
            .padding(.bottom, 5)
            
            // Post content
            Text(post.message)
                .font(.body)
                .bold()


            // Like and comment buttons
            HStack {
                Button(action: {
                    // like button logic
                }) {
                    HStack {
                        Image(systemName: "heart")
                        Text("Like")
                            .bold()
                    }
                    .padding()
                    .foregroundColor(.blue)
                    .background(Color.secondary.opacity(0.08))
                    .cornerRadius(10)
                }
                
                Spacer()
                
                Button(action: {
                    //  comment button logic
                }) {
                    HStack {
                        Image(systemName: "message")
                        Text("Comment")
                            .bold()
                    }
                    .padding()
                    .foregroundColor(.blue)
                    .background(Color.secondary.opacity(0.08))
                    .cornerRadius(10)
                }
            }
        }
        .padding()
        .background(Color.secondary.opacity(0.1))
        .cornerRadius(10)
    }
}


#if DEBUG
struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(id: "1", message: "This is a test post", createdBy: "test created by", createdAt: "test created at", comments: 1, likes: ["1"]), postViewModel: PostsViewModel(), token: "test token")
    }
}
#endif



//            Text(post.username ?? "loading...")
//            Text(post.formattedCreatedAt)
//                .foregroundStyle(Color.gray)
//            Text(post.message)
//            Text("Comments: \(post.comments)")
//
//        }
////        .onAppear{
////            _ = postViewModel.getUserDetails(userCreatedBy: post.createdBy, token: token, post_id: post.id )
////        }
//    }
