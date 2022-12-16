//
//  RoutineResponse.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 13/12/22.
//

import Foundation

public struct ExcerciseStruct: Decodable {
    let name: String
    let muscle: String
    var series: Int
    var reps: Int
}

struct RoutineResponse: Decodable {
    
    let name: String
    let author: String
    let description: String?
    let time: Int?
    let exercises: [ExcerciseStruct]
    
    enum CodingKeys: String, CodingKey {
        case name
        case author
        case description = "descripcion"
        case time
        case exercises
    }
    
}
