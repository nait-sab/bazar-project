//
//  apiJson.swift
//  bazar-ccm
//
//  Created by etudiant on 21/09/2022.
//

import Foundation

class ApiJson {
    func getUsers(completion:@escaping ([User]) -> ()) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        URLSession.shared.dataTask(with: url) {
            (data, _, _) in
            let users = try! JSONDecoder().decode([User].self, from: data!) 
            DispatchQueue.main.async {
                completion(users)
            }
        }.resume()
    }
}
