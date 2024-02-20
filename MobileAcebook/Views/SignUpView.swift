//
//  SignUpView.swift
//  MobileAcebook
//
//  Created by Tom Mazzag on 19/02/2024.
//

import SwiftUI

struct SignUpView: View {
    
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
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
                    let user = User(username: username, password: password)
                    print(user)
                    //Code for creating an account
                }
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .background(.blue)
                    .listRowBackground(Color.blue)
            }
            
            
        }
    }
}

#Preview {
    SignUpView()
}
