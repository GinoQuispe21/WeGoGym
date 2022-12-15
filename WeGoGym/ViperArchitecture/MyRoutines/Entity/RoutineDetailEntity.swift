//
//  RoutineDetailEntity.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 13/12/22.
//

import Foundation

class RoutineDetail : ItemRoutineDetailProtocol {
    
//    var excercies: [ExcerciseStruct]
    var name: String
    var author: String
    var description: String
    var countExcercises: Int
    var time: Int
    var excercies: [ExcerciseStruct]
//    var arrayExcercise: [ExcerciseStruct]
    required init(name: String, author: String, description: String, countExcercises: Int, time: Int, excercies: [ExcerciseStruct]){
        self.name = name
        self.author = author
        self.description = description
        self.countExcercises = countExcercises
        self.time = time
        self.excercies = excercies
    }
}

