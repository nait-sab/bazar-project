//
//  TabBarView.swift
//  bazar-ccm
//
//  Created by etudiant on 17/01/2023.
//

import SwiftUI

struct TabBarView: View {
    @Binding var ongletActuel: Onglet
    
    private var fillImage: String {
        ongletActuel.rawValue + ".fill"
    }
    
    private var ongletCouleur: Color {
        switch ongletActuel {
        case .home:
            return .blue
        case .json:
            return .green
        case .firebase:
            return .indigo
        case .map:
            return .orange
        }
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Onglet.allCases, id: \.rawValue) { onglet in
                    Spacer()
                    Image(systemName: ongletActuel == onglet ? fillImage : onglet.rawValue)
                        .scaleEffect(ongletActuel == onglet ? 1.25 : 1.0)
                        .foregroundColor(ongletActuel == onglet ? ongletCouleur : .gray)
                        .font(.system(size: 22))
                        .onTapGesture {
                            withAnimation(.easeIn(duration: 0.1)) {
                                ongletActuel = onglet
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
            .background(.thinMaterial)
            .cornerRadius(10)
            .padding()
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(ongletActuel: .constant(.home))
    }
}
