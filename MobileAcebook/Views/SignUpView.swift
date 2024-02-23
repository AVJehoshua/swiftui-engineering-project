//
//  SignUpView.swift
//  MobileAcebook
//
//  Created by Tom Mazzag on 19/02/2024.
//

import SwiftUI
struct SignUpView: View {
    
    let signUp = SignUp()
    
    @State public var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var avatar = ""
    @State private var isSignedUp = false
    @State private var isValidInput = false
    @EnvironmentObject var authenticationManager: AuthenticationManager

    var body: some View {
        NavigationView {
            ZStack {
                VStack{
                    Spacer()
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .accessibilityIdentifier("makers-logo")
                        .padding([.top], 100)
                    
                    Text("Create a new account!")
                        .font(.largeTitle)
                        .padding(.bottom, 20)
                        .accessibilityIdentifier("welcomeText")
                        .foregroundColor(Color(hex: "3468C0"))
            VStack {
        
                TextField("Username", text: $username)
                    .textInputAutocapitalization(.never)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
                
                TextField("Email", text: $email)
                    .textInputAutocapitalization(.never)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
                
                SecureField("Password", text: $password)
                    .textInputAutocapitalization(.never)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
                
                Button("Create an account") {
                    let user = User(username: username, password: password, email: email, avatar: avatar)
                    if signUp.isValidEmail(email: user.email) && signUp.isValidPassword(password: user.password) {
                        signUp.signUpUser(user: user) { success in
                            if success {
                                authenticationManager.isLoggedIn = true
                                print("User signed up successfully!")
                                let service = LoginService()
                                let user = UserData(email: email, password: password)
                                _ = service.login(user){ success in
                                    if success {
                                        email = ""
                                        password = ""
                                    } else {
                                        print("Error logging in")

                                    }
                                }
                            } else {
                                print("Error signing up!")
                                self.isSignedUp = false
                            }
                        }
                    } else {
                        print("Invalid user details!")
                    }
                }
                .padding()
                .buttonStyle(.borderedProminent)
                .tint(Color(hex: "#3468C0"))
                
                Spacer()
                
                
                if isSignedUp {
                    NavigationLink(
                        destination: ProfilePageView(username: username),
                        isActive: $isSignedUp) {
                            EmptyView()
                        }
                        .hidden()
                }
            }
            .frame(width: 300)
        }
    }

        }
    }
}






//                .onAppear {
//                    isValidInput = signUp.isValidEmail(email: email) && signUp.isValidPassword(password: password)
//                }
