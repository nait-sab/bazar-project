//
//  firebaseTool.swift
//  bazar-ccm
//
//  Created by etudiant on 22/09/2022.
//

import Foundation
import Firebase

class FirebaseTool
{
    public static func isLogged() -> Bool
    {
        return Auth.auth().currentUser?.uid != nil
    }
    
    public static func connexion(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {
            result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    public static func inscription(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) {
            result, error in
            if error != nil {
                print(error!.localizedDescription)
            }
        }
    }
    
    public static func deconnexion() {
        do {
            try Auth.auth().signOut()
        } catch let erreur as NSError {
            print("erreur de deconnexion : %@", erreur)
        }
    }
}
