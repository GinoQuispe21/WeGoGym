//
//  ExerciseResponse.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 14/12/22.
//

import Foundation

struct ExerciseResponse: Decodable {
    
    let name: String
    let description: String
    let muscle: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case description = "descripcion"
        case muscle
    }
    
}

