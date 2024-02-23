//
//  CreatePostView.swift
//  MobileAcebook
//
//  Created by Alan Gardiner on 21/02/2024.
//

import SwiftUI

func mockCreatePostService(post: String, token: String)-> Bool{
    let result: Bool = true
//    print(token)
//    print(post)
    return result
}


struct CreatePostView: View {
    @State private var newPost = ""
    var token: String
    
    var body: some View {
        
            HStack{
                TextField("What's on your mind?", text: $newPost)
                    .padding(6)
                    .background(.white.opacity(0.9))
                    .cornerRadius(10)

                Button("Submit"){
                    if !newPost.isEmpty{
                        let result = mockCreatePostService(post: newPost, token: token)
                        
                        if result{
                            newPost = ""
                            print("New post created")
                        }else{
                            print("Couldn't create post")
                        }
                    }
                }
                .foregroundColor(.white)
                
// Haven't decided which way of writing button is better depending on how we want to style it.
                
//                Button(action: {
//                    if !newPost.isEmpty{
//                        let result = mockCreatePostService(post: newPost, token: token)
//                        if result {
//                            newPost = ""
//                            print("New new created")
//                        }else{
//                            print("Couldn't create post")
//                        }
//                    }
//                }, label: {
//                    Text("Submit")
//                })
            }
    }
}


#Preview {
    CreatePostView(token: "Test Token")
}
