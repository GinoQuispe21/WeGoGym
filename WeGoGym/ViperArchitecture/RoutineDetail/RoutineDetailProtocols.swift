//
//  RoutinesProtocols.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 13/12/22.
//

import Foundation

// public asumiendo que estamos en diferentes modulos

public protocol ItemRoutineDetailProtocol {
    var name: String { get }
    var author: String { get }
    var description: String { get }
    var countExcercises: Int { get }
    var time: Int { get }
    var excercies: [ExcerciseStruct] { get }
}

protocol DetailRoutinePresenterProtocol {
    func getName() -> String
    func getAuthor() -> String
    func getDescription() -> String
    func getCountExcercises() -> Int
    func getTime() -> Int
    func getExcercises() -> [ExcerciseStruct]
}
