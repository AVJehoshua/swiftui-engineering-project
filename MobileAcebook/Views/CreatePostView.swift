//
//  CreatePostView.swift
//  MobileAcebook
//
//  Created by Alan Gardiner on 21/02/2024.
//

import SwiftUI

//func mockCreatePostService(post: String, token: String)-> Bool{
//    let result: Bool = true
////    print(token)
////    print(post)
//    return result
//}


struct CreatePostView: View {
    @State private var newPost: String = ""
    
    let createPostService = CreatePost()
    
    var body: some View {
        
        HStack{
            TextField("What's on your mind?", text: $newPost)
                .padding(6)
                .background(.gray.opacity(0.1))
                .cornerRadius(10)
            
            Button("Submit"){
                if !newPost.isEmpty{
                    createPostService.createPost(newPost: NewPost(message: newPost)) { result in
                        if result{
                            newPost = ""
                            print("New post created")
                        }
                        else{
                            print("Couldn't create post")
                        }
                    }
                }
            }
        }
    }
}



#Preview {
    CreatePostView()
}
