//
//  userView.swift
//  bazar-ccm
//
//  Created by etudiant on 21/09/2022.
//

import SwiftUI

struct userView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: pageMaps()) {
                    Text("Voir ma position")
                }
                if !FirebaseTool.isLogged() {
                    NavigationLink(destination: PageInscription()) {
                        Text("Inscription Firebase")
                    }
                    NavigationLink(destination: PageConnexion()) {
                        Text("Connexion Firebase")
                    }
                } else {
                    Button("Déconnexion") {
                        FirebaseTool.deconnexion()
                    }
                }
            }
        }
    }
}

struct userView_Previews: PreviewProvider {
    static var previews: some View {
        userView()
    }
}
