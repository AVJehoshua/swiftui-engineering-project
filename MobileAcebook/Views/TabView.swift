//
//  TestView.swift
//  MobileAcebook
//
//  Created by Martynas Prusevicius on 20/02/2024.
//

import SwiftUI

struct TestView: View {
//    @Binding var isLoggedIn: Bool
    @EnvironmentObject var authenticationManager: AuthenticationManager
    
    var body: some View {
        TabView {
            FeedPageView()
                .tabItem {
                    Label("Feed", systemImage: "list.bullet.below.rectangle")
                }
            ProfilePageView(username: username)
                .tabItem {
                    Label("Profile", systemImage: "person.crop.circle.fill")
                }
        }
        
    }
}
//
//#Preview {
//    TestView()
//}
