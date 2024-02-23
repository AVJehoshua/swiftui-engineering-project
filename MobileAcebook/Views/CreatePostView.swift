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
    @EnvironmentObject var refreshTrigger: RefreshTrigger
    
    let createPostService = CreatePost()
    
    var body: some View {
            HStack{
                TextField("What's on your mind?", text: $newPost)
                    .padding(6)
                    .background(.white)
                    .cornerRadius(10)
                    .foregroundColor(.black)
                
                        Button("Submit"){
                            if !newPost.isEmpty{
                                createPostService.createPost(newPost: NewPost(message: newPost)) { result in
                                    if result{
                                        newPost = ""
                                        print("New post created")
                                        DispatchQueue.main.async {
                                            refreshTrigger.trigger = true
                                        }
                                    }
                                    else{
                                        print("Couldn't create post")
                                    }
                                }
                            }
                        }.foregroundColor(.white)
                    }
                }
            }

