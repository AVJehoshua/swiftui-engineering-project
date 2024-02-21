//
//  CreatePostView.swift
//  MobileAcebook
//
//  Created by Alan Gardiner on 21/02/2024.
//

import SwiftUI

func mockCreatePostService(post: String, token: String)-> Bool{
    let result: Bool = true
    print(token)
    print(post)
    return result
}



struct CreatePostView: View {
    @State private var newPost = ""
    var token: String
    
    var body: some View {
        
            Form{
                HStack{
                    TextField("What's on your mind?", text: $newPost)
                    Button("Submit"){
                        let result = mockCreatePostService(post: newPost, token: token)
                        newPost = ""
                        print(result)
                    }
                }
            }
            
    }
}


#Preview {
    CreatePostView(token: "Test Token")
}
