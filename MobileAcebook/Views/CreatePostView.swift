//
//  CreatePostView.swift
//  MobileAcebook
//
//  Created by Alan Gardiner on 21/02/2024.
//

import SwiftUI

struct CreatePostView: View {
    @State private var newPost = ""
    
    var body: some View {
        HStack{
            Form{
                TextField("What's on your mind?", text: $newPost)
            }
            
        }
    }
}


#Preview {
    CreatePostView()
}
