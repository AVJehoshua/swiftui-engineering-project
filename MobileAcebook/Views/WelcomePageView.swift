//
//  WelcomePageView.swift
//  MobileAcebook
//
//  Created by Josué Estévez Fernández on 30/09/2023.
//

import SwiftUI

let signUp = SignUp()

struct WelcomePageView: View {
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
                    signUp.signUpUser(user: User(username: "Test username", password: "Test password", email: "Test2@email.com"))
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
