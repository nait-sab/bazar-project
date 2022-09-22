//
//  pageDetailJson.swift
//  bazar-ccm
//
//  Created by etudiant on 22/09/2022.
//

import SwiftUI

struct pageDetailJson: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                Text("Username : \(user.username)").font(.title2).multilineTextAlignment(.leading)
                Text("Email : \(user.email)").font(.title2).multilineTextAlignment(.leading)
            }
            Spacer()
        }.padding(10).navigationBarTitle(Text(user.name), displayMode: .automatic)
    }
}
