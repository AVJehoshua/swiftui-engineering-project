//
//  MobileAcebookApp.swift
//  MobileAcebook
//
//  Created by Josué Estévez Fernández on 30/09/2023.
//

import SwiftUI

var token = ""
var username = ""

class AuthenticationManager: ObservableObject {
    @Published var isLoggedIn = false
}

@main
struct MobileAcebookApp: App {
    @StateObject var authenticationManager = AuthenticationManager()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if authenticationManager.isLoggedIn {
                    TestView()
                } else {
                    WelcomePageView()
                }
            }
            .environmentObject(authenticationManager)
        }
    }
}
