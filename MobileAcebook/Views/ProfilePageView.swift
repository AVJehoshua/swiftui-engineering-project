//
//  ProfilePageView.swift
//  MobileAcebook
//
//  Created by AVJehoshua on 20/02/2024.
//

import SwiftUI

struct ProfilePageView: View {
    @State var isLoggedIn: Bool
    var username: String
    
    var body: some View {
        NavigationView {
            VStack(alignment: .trailing, spacing: 20) {
                Button("Logout") {
                    isLoggedIn = false
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
