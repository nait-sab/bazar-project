//
//  firebaseView.swift
//  bazar-ccm
//
//  Created by etudiant on 21/09/2022.
//

import SwiftUI

struct FirebaseTab: View {
    @ObservedObject var model = ViewModelMessage()
    
    @State var message = ""
    
    var body: some View {
        ZStack {
            Color("Fond").edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("API").font(.system(size: 30, weight: .bold, design: .rounded))
                
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
                }.onAppear {
                    UITableView.appearance().backgroundColor = .clear
                }
                
                Divider()
                
                VStack(spacing: 5) {
                    HStack {
                        TextField("Message...", text: $message)
                    }
                    .modifier(fondSaisie(startColor: .blue, endColor: .purple))
                    .padding()
                    
                    Button (action: {
                        model.addData(message: message)
                        message = ""
                    }, label: {
                      Text("Ajouter")
                            .foregroundColor(.black)
                    })
                }
            }
        }
    }
    
    init() {
        model.getData()
    }
}

struct firebaseView_Previews: PreviewProvider {
    static var previews: some View {
        FirebaseTab()
    }
}

struct fondSaisie: ViewModifier {
    var startColor: Color
    var endColor: Color
    
    func body(content: Content) -> some View {
        content
            .padding()
            .background(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .cornerRadius(10)
            .padding(5)
            .foregroundColor(.white)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.5))
            .font(.custom("Open Sans", size: 18))
            .shadow(radius: 10)
    }
}
