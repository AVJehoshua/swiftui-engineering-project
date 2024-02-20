//
//  WelcomePageView.swift
//  MobileAcebook
//
//  Created by Josué Estévez Fernández on 30/09/2023.
//

import SwiftUI

struct WelcomePageView: View {
    
    let posts = PostsViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()

                Text("Welcome to Acebook!")
                    .font(.largeTitle)
                    .padding(.bottom, 20)
                    .accessibilityIdentifier("welcomeText")

                Spacer()

                Image("makers-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .accessibilityIdentifier("makers-logo")
                
                Spacer()

                Button("Sign Up") {
                    _ = posts.fetchPosts(token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiNjVkMzQ3OTFlMGU3ZWMyMzRjMzc2ZTdlIiwiaWF0IjoxNzA4NDMyNDcxLCJleHAiOjE3MDg0MzYwNzF9.5xJ3HbGQE-r132kjeAJuAiFeaUilbvfSFuneM2R4cYk")
                    print(posts.postsList)
                }
                .accessibilityIdentifier("signUpButton")
                
                Spacer()
            }
        }
    }
}

struct WelcomePageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageView()
    }
}
