//
//  ProfilePageView.swift
//  MobileAcebook
//
//  Created by AVJehoshua on 20/02/2024.
//

import SwiftUI

struct ProfilePageView: View {
    
    var username: String
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 20) {
                HStack(spacing: 20) {
                    Image(systemName: "person.crop.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 125, height: 160)
                        .symbolRenderingMode(.hierarchical)
                        .foregroundStyle(.blue)
                    
                    
                    Text("Welcome, \(username)")
                        .font(.title)
                        .fontWeight(.bold)
                }
                
                Spacer()
                
            }
            .padding()
        }
    }
}

#if DEBUG
struct ProfilePageView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePageView(username: "AVjehoshua")
    }
}
#endif
