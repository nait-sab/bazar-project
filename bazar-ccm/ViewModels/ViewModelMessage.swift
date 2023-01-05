//
//  ViewModelMessage.swift
//  bazar-ccm
//
//  Created by Naitsab on 05/01/2023.
//

import Foundation
import Firebase

class ViewModelMessage: ObservableObject {
    @Published var listeMessages = [MessageModel]()
    
    func updateData(cible: MessageModel) {
        // Reference
        let reference = Firestore.firestore()
        
        // Update
        reference.collection("messages").document(cible.id).setData(["message": "Updated message"], merge: true) { error in
            if error == nil {
                self.getData()
            } else {
                return
            }
        }
    }
    
    func deleteData(cible: MessageModel) {
        // Reference
        let reference = Firestore.firestore()
        
        // Delete
        reference.collection("messages").document(cible.id).delete { error in
            if error == nil {
                DispatchQueue.main.async {
                    self.listeMessages.removeAll { message in
                        return message.id == cible.id
                    }
                }
            } else {
                return
            }
        }
    }
    
    func addData(message: String) {
        // Reference
        let reference = Firestore.firestore()
        
        // Add
        reference.collection("messages").addDocument(data: ["message": message]) { error in
            if error == nil {
                self.getData()
            } else {
                return
            }
        }
    }
    
    func getData() {
        // Reference
        let reference = Firestore.firestore()
        
        // Read
        reference.collection("messages").getDocuments { snapshot, error in
            // Error case
            if error == nil {
                DispatchQueue.main.async {
                    if let snapshot = snapshot {
                        // Get documents converted to models
                        self.listeMessages = snapshot.documents.map { document in
                            return MessageModel(id: document.documentID, message: document["message"] as? String ?? "")
                        }
                    }
                }
            } else {
                return
            }
        }
    }
}
