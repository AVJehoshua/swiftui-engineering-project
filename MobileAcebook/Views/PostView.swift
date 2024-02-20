//
//  PostView.swift
//  MobileAcebook
//
//  Created by Alan Gardiner on 20/02/2024.
//

import SwiftUI

struct PostView: View {
    let post: Post
    
    var body: some View{
        VStack(alignment: .leading){
            Text(post.message)
            Text("Comments: \(post.comments)")
        }
    }
}

//#Preview {
//    PostView(post: Post(id: "1", message: "Example Post", comments: 1))
//}
