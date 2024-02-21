//
//  WelcomePageView.swift
//  MobileAcebook
//
//  Created by Josué Estévez Fernández on 30/09/2023.
//

import SwiftUI

let signUp = SignUp()

extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        print(cleanHexCode)
        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}

struct WelcomePageView: View {
    @State private var email = ""
    @State private var password = ""
    @Binding var isLoggedIn: Bool
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer()
                    
                    Text("Welcome to Acebook!")
                        .font(.largeTitle)
                        .padding(.bottom, 20)
                        .accessibilityIdentifier("welcomeText")
                        .foregroundColor(Color(hex: "3468C0"))
                    Spacer()
                    VStack{
                        
                        
                        TextField("Enter e-mail", text: $email)
                            .textInputAutocapitalization(.never)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
                        
                        SecureField("Enter password", text: $password)
                            .textInputAutocapitalization(.never)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.white))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 1))
                        
                        Button("Sign in") {
                            let user = UserData(email: email, password: password)
                            let service = LoginService()
                            _ = service.login(user){ success in
                                if success {
                                    email = ""
                                    password = ""
                                    isLoggedIn = true
                                } else {
                                    print("Error logging in")
                                }
                            }
                        }
                        .padding()
                        .buttonStyle(.borderedProminent)
                        .tint(Color(hex: "#3468C0"))
                    }
                    .frame(width: 300)
                    
                    Spacer()
                    Spacer()
                    
                    Button("Create a new account") {
                        // TODO: sign up logic
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color(hex: "#3468C0"))
                    .accessibilityIdentifier("signUpButton")
                    
                    
//                    Button("Sign Up") {
//                        signUp.signUpUser(user: User(username: "Test username", password: "Test password", email: "Test2@email.com", avatar:"/person.fill")) { success in
//                            if success {
//                                // Handle successful signup
//                                print("User signed up successfully!")
//                            } else {
//                                // Handle signup failure
//                                print("Error signing up!")
//                            }
//                        }
//                    }
                    
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
}
