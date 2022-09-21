//
//  jsonModel.swift
//  bazar-ccm
//
//  Created by etudiant on 21/09/2022.
//

import Foundation

struct User : Codable, Identifiable {
    let id: String = UUID().uuidString
    
    let username: String
    let name : String
    let email : String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case username
        case email
    }
    
    //https://www.youtube.com/watch?v=R_f0GdEwvn8
}
