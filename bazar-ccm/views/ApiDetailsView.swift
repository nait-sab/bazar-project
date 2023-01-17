//
//  ApiDetailsView.swift
//  bazar-ccm
//
//  Created by etudiant on 17/01/2023.
//

import SwiftUI

struct ApiDetailsView: View {
    let user: User
    
    var body: some View {
        ZStack {
            Color("Fond").edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Username : \(user.username)").font(.title2).multilineTextAlignment(.leading)
                    Text("Email : \(user.email)").font(.title2).multilineTextAlignment(.leading)
                }
                Spacer()
            }.padding(10).navigationBarTitle(Text(user.name), displayMode: .automatic)
        }
    }
}
