//
//  accueilView.swift
//  bazar-ccm
//
//  Created by etudiant on 21/09/2022.
//

import SwiftUI
import UserNotifications

struct accueilView: View {
    var notificationCentre = UNUserNotificationCenter.current()
    
    var body: some View {
        List {
            VStack(alignment: .leading) {
                Text("Bonjour").font(.system(size: 35, weight: .bold, design: .rounded))
                Text("Bastian Boulogne").font(.system(size: 35, weight: .bold, design: .rounded))
            }.padding(.bottom, 50)
            Image("image").resizable().frame(width: 250, height: 250)
            Button("Demander autorisation") {
                demanderAutorisation()
            }
            Button("Envoyer une notification") {
                envoyerNotification()
            }
            
        }.onAppear {
            UITableView.appearance().backgroundColor = .clear
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
        
        let date = Date().addingTimeInterval(10)
        let dateComposants = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComposants, repeats: false)
        
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: contenu, trigger: trigger)
        
        notificationCentre.add(request) {
            (error) in
        }
    }
}

struct accueilView_Previews: PreviewProvider {
    static var previews: some View {
        accueilView()
    }
}
