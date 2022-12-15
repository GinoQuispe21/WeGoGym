//
//  ExerciseEntity.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 14/12/22.
//

struct ExerciseEntity {
    let name: String
    let description: String
    let muscle: String
    
    static func make(_ exercises: [ExerciseResponse]) -> [ExerciseEntity] {
        return exercises.map( { ExerciseEntity ( name: $0.name, description: $0.description, muscle: $0.muscle)} )
    }
}
