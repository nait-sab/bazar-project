//
//  jsonView.swift
//  bazar-ccm
//
//  Created by etudiant on 21/09/2022.
//

import SwiftUI

struct JsonTab: View {
    @State var users: [User] = []
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("Fond").edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("API").font(.system(size: 30, weight: .bold, design: .rounded))
                    
                    List(users) { user in
                        NavigationLink(destination: ApiDetailsView(user: user)) {
                            tableauLigne(user: user)
                        }
                    }
                    .onAppear {
                        ApiJson().getUsers {
                            (users) in
                            self.users = users
                        }
                        UITableView.appearance().backgroundColor = .clear
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
        JsonTab()
    }
}
