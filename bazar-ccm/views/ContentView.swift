//
//  ContentView.swift
//  bazar-ccm
//
//  Created by etudiant on 21/09/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var ongletActuel: Onglet = .home
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        ZStack {
            Color("Fond").edgesIgnoringSafeArea(.all)
            
            VStack {
                ZStack {
                    switch ongletActuel {
                    case .home:
                        HomeTab()
                    case .json:
                        JsonTab()
                    case .firebase:
                        FirebaseTab()
                    case .map:
                        MapTab()
                    }
                }
                TabBarView(ongletActuel: $ongletActuel)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
