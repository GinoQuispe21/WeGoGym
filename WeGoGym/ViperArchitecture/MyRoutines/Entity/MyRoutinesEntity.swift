//
//  MyRoutinesEntity.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 13/12/22.
//

import Foundation

//struct ExerciseOfRoutineEntity {
//    let name: String
//    let muscle: String
//    var series: Int
//    var reps: Int
////
////    static func make(_ exercises: [ExcerciseStruct]) -> [ExerciseOfRoutineEntity] {
////        return exercises.map( { ExerciseOfRoutineEntity(name: $0.name, muscle: $0.muscle, series: $0.series, reps: $0.reps) })
////    }
////
//}

struct RoutineEntity {
    let name: String
    let description: String
    let author: String
    let time: Int
    let exercises: [ExcerciseStruct]
    
    static func make(_ routines: [RoutineResponse]) -> [RoutineEntity] {
        return routines.map( { RoutineEntity(name: $0.name, description: $0.description ?? "", author: $0.author, time: $0.time ?? 0, exercises: $0.exercises) } )
    }
}
