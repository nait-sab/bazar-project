//
//  PageConnexion.swift
//  bazar-ccm
//
//  Created by etudiant on 22/09/2022.
//

import SwiftUI
import Firebase

struct PageConnexion: View {
    @State private var email = ""
    @State private var password = ""
    @State private var connected = false
    
    var body: some View {
        ZStack {
            Color.blue
            Circle().scale(1.7).foregroundColor(.white.opacity(0.15))
            Circle().scale(1.35).foregroundColor(.white)
            VStack {
                Text("Connexion").font(.largeTitle).bold().padding()
                TextField("Email", text: $email).padding().frame(width: 300, height: 50).background(Color.black.opacity(0.05)).cornerRadius(10)
                SecureField("Password", text: $password).padding().frame(width: 300, height: 50).background(Color.black.opacity(0.05)).cornerRadius(10)
                Button("Connexion") {
                    FirebaseTool.connexion(email: email, password: password)
                }.foregroundColor(.white).frame(width: 300, height: 50).background(Color.blue).cornerRadius(10)
            }
        }.onAppear {
            Auth.auth().addStateDidChangeListener {
                auth, user in
                if user != nil {
                    connected.toggle()
                }
            }
        }
    }
}

struct PageConnexion_Previews: PreviewProvider {
    static var previews: some View {
        PageConnexion()
    }
}
