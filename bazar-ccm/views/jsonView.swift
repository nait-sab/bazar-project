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
            VStack {
                List(users) { user in
                    NavigationLink(destination: pageDetailJson(user: user)) {
                        tableauLigne(user: user)
                    }
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
}

struct tableauLigne: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(user.name).font(.headline)
            Text(user.email).font(.headline)
        }.padding(10)
    }
}

struct jsonView_Previews: PreviewProvider {
    static var previews: some View {
        jsonView()
    }
}
