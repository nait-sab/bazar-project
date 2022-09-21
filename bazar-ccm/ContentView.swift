//
//  ContentView.swift
//  bazar-ccm
//
//  Created by etudiant on 21/09/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            accueilView().tabItem {
                Image(systemName: "house.fill")
                Text("Home")
            }
            jsonView().tabItem {
                Image(systemName: "doc.plaintext.fill")
                Text("Json")
            }
            firebaseView().tabItem {
                Image(systemName: "cloud.fill")
                Text("Firebase")
            }
            userView().tabItem {
                Image(systemName: "person.fill")
                Text("User")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
