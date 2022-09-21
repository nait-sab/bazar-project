//
//  jsonView.swift
//  bazar-ccm
//
//  Created by etudiant on 21/09/2022.
//

import SwiftUI

struct jsonView: View {
    @State var users: [User] = []
    
    var body: some View {
        NavigationView {
            List(users) { user in
                HStack {
                    Text(user.name).font(.headline)
                }.padding(10)
            }
            .navigationBarTitle("Données JSON")
            .onAppear {
                ApiJson().getUsers {
                    (users) in
                    self.users = users
                }
            }
        }
    }
}

struct jsonView_Previews: PreviewProvider {
    static var previews: some View {
        jsonView()
    }
}
