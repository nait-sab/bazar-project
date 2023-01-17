//
//  HomeView.swift
//  bazar-ccm
//
//  Created by etudiant on 17/01/2023.
//

import SwiftUI

struct HomeTab: View {
    var notificationCentre = UNUserNotificationCenter.current()
    
    var body: some View {
        ZStack {
            Color("Fond").edgesIgnoringSafeArea(.all)
            
            VStack {
                VStack {
                    Text("Bonjour ").font(.system(size: 28, weight: .bold, design: .rounded))
                    + Text("Bastian Boulogne").font(.system(size: 22, design: .rounded))
                    
                    Image("image")
                        .resizable()
                        .frame(width: 250, height: 250)
                }
                .padding()
                .background(Rectangle()
                    .foregroundColor(.white)
                                .cornerRadius(20)
                                .shadow(radius: 20))
                .padding()
                
                VStack {
                    Button("Demander permission") {
                        demanderAutorisation()
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        Color.blue
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    )
                    
                    Button("Envoyer la notification") {
                        envoyerNotification()
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(
                        Color.blue
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    )
                }
                .padding()
                .background(Rectangle()
                    .foregroundColor(.white)
                                .cornerRadius(20)
                                .shadow(radius: 20))
                .padding()
            }
        }
    }
    
    func demanderAutorisation() {
        notificationCentre.requestAuthorization(options: [.alert, .sound]) {
            (granted, error) in
        }
    }
    
    func envoyerNotification() {
        let contenu = UNMutableNotificationContent()
        contenu.title = "Bazar CCM"
        contenu.body = "Bonjour"
        
        let date = Date().addingTimeInterval(8)
        let dateComposants = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComposants, repeats: false)
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: contenu, trigger: trigger)
        
        notificationCentre.add(request) {
            (error) in
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTab()
    }
}
