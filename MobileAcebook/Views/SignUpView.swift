//
//  SignUpView.swift
//  MobileAcebook
//
//  Created by Tom Mazzag on 19/02/2024.
//

import SwiftUI

struct SignUpView: View {
    
    let signUp = SignUp()
    
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var avatar = ""
    @State private var isSignedUp = false
    @State private var isValidInput = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("makers-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .accessibilityIdentifier("makers-logo")
                
                
                Form {
                    Section {
                        TextField("Username", text: $username)
                    }
                    
                    Section {
                        
                        TextField("Email", text: $email)
                            .autocapitalization(.none)
                    }
                    
                    Section {
                        SecureField("Password", text: $password)
                    }
                    
                    Button("Create an account") {
                        let user = User(username: username, password: password, email: email, avatar: avatar)
                        if signUp.isValidEmail(email: email) && signUp.isValidPassword(password: password) {
                            signUp.signUpUser(user: user)
                            isSignedUp = true
                            print("User signed up successfully!")
                        } else {
                            print("Invalid user details!")
                        }
                        //Code for creating an account
                    }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(.blue)
                    .listRowBackground(Color.blue)
                }
                // code navigates to profile on sign up
                NavigationLink(
                    destination: ProfilePageView(username: username),
                    isActive: $isSignedUp,
                    label: { EmptyView() }
                )

//                .onAppear {
//                    isValidInput = signUp.isValidEmail(email: email) && signUp.isValidPassword(password: password)
//                }
            }
        }
    }
}
#if DEBUG
struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
#endif
