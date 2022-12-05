//
//  Excercise.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 4/12/22.
//

import Foundation

struct Excercise{
    
    var name: String
    var description: String
    var muscle: String
    var series: Int
    var reps: Int
    
    init(name: String, description: String, muscle: String, series: Int, reps: Int) {
        self.name = name
        self.description = description
        self.muscle = muscle
        self.series = series
        self.reps = reps
    }
}
