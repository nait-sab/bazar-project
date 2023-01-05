//
//  firebaseView.swift
//  bazar-ccm
//
//  Created by etudiant on 21/09/2022.
//

import SwiftUI

struct firebaseView: View {
    @ObservedObject var model = ViewModelMessage()
    
    @State var message = ""
    
    var body: some View {
        NavigationView {
            VStack {
                List(model.listeMessages) { item in
                    HStack {
                        Text(item.message)
                        Spacer()

                        // Update Button
                        Button (action: {
                            model.updateData(cible: item)
                        }, label: {
                          Image(systemName: "pencil")
                        })
                        .buttonStyle(BorderlessButtonStyle())
                        
                        // Delete Button
                        Button (action: {
                            model.deleteData(cible: item)
                        }, label: {
                          Image(systemName: "minus.circle")
                        })
                        .buttonStyle(BorderlessButtonStyle())
                    }
                }
                .navigationBarTitle("Données Firebase")
                
                Divider()
                
                VStack(spacing: 5) {
                    TextField("Message", text: $message).textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button (action: {
                        model.addData(message: message)
                        message = ""
                    }, label: {
                      Text("Ajouter")
                    })
                }
                
                Divider()
            }
        }
    }
    
    init() {
        model.getData()
    }
}

struct firebaseView_Previews: PreviewProvider {
    static var previews: some View {
        firebaseView()
    }
}
