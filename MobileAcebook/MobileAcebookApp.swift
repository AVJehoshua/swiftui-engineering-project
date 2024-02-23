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

class RefreshTrigger: ObservableObject {
    @Published var trigger = false
}

@main
struct MobileAcebookApp: App {
    @StateObject var authenticationManager = AuthenticationManager()
    @StateObject var refreshTrigger = RefreshTrigger()

    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if refreshTrigger.trigger {
                    TestView()
                } else if authenticationManager.isLoggedIn {
                    TestView()
                }else {
                    WelcomePageView()
                }
            }
            .environmentObject(authenticationManager)
            .environmentObject(refreshTrigger)
        }
    }
}
