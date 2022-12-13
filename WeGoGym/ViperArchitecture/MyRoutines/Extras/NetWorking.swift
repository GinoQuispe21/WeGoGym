//
//  NetWorking.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 13/12/22.
//

import Foundation

protocol RoutinesRepository {
    func fetchRoutines() -> [RoutineResponse]
}

class MyRoutinesAPI : RoutinesRepository{
    
    func fetchRoutines() -> [RoutineResponse] {
        
        let resource = "routines_success"
        
        if let url = Bundle.main.url(forResource: resource, withExtension: "json") {
            
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let result = try decoder.decode([RoutineResponse].self, from: data)
                return result
            } catch let error {
                print(error.localizedDescription)
            }
        }
        return []
    }
    
}
