//
//  ProfilePageView.swift
//  MobileAcebook
//
//  Created by AVJehoshua on 20/02/2024.
//

import SwiftUI

struct ProfilePageView: View {
    @EnvironmentObject var authenticationManager: AuthenticationManager
    @EnvironmentObject var refreshTrigger: RefreshTrigger

    var username: String
    
    var body: some View {
        NavigationView {
            VStack(alignment: .trailing, spacing: 20) {
                Button("Logout") {
                    refreshTrigger.trigger = false
                    authenticationManager.isLoggedIn = false
                }
                
                HStack(spacing: 25)
                {
//                    Image(systemName: "person.crop.circle.fill")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 125, height: 160)
//                        .symbolRenderingMode(.hierarchical)
//                        .foregroundStyle(.blue)
//                    
                    
                    Text("Welcome, \(username)!")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                    ImageUploadView()
                    
                    Spacer()
                }
                
                Spacer()
                
            }
            .foregroundColor(.black)
            .padding()
        }
    }
}

//#if DEBUG
//struct ProfilePageView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfilePageView(username: "AVJehoshua")
//    }
//}
//#endif
