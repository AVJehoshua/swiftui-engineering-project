//
//  MobileAcebookApp.swift
//  MobileAcebook
//
//  Created by Josué Estévez Fernández on 30/09/2023.
//

import SwiftUI

var token = ""
var username = ""

@main
struct MobileAcebookApp: App {
    @State private var isLoggedIn = false
    var body: some Scene {
        WindowGroup {
            NavigationView {
                if isLoggedIn {
                    TestView(isLoggedIn: false)
                } else {
                    WelcomePageView(isLoggedIn: $isLoggedIn)
                }
            }
        }
    }
}
