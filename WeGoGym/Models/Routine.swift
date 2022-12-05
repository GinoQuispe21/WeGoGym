//
//  Routine.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 4/12/22.
//

import Foundation

struct Routine {
    
    var name: String
    var desciption: String
    var author: String
    var time: Int
    var excercies: [Excercise] = []
    var countExc: Int
    
    init(name: String, desciption: String, author: String, time: Int, excercies: [Excercise], countExc: Int) {
        self.name = name
        self.desciption = desciption
        self.author = author
        self.time = time
        self.excercies = excercies
        self.countExc = countExc
    }
}
