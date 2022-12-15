//
//  MyRoutinesInteractor.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 13/12/22.
//

import Foundation

protocol MyRoutinesInteractorProtocol {
    func reciveDataFromApi()
}

class MyRoutinesInteractor : MyRoutinesInteractorProtocol{
    
    var api: RoutinesRepository?
    var presenter: MyRoutinesPresenterProtocol?
    
    required init(presenter: MyRoutinesPresenterProtocol, api: RoutinesRepository) {
        self.presenter = presenter
        self.api = api
    }
    
    func reciveDataFromApi() {
//        print("asignamos los datos al presenter")
//        var array: [String] = []
////        switch option {
////        case 0:
////            array = ["0", "0", "0"]
////            return
////        case 1:
////            array = ["1", "1", "1"]
////        case 2:
////            array = ["2", "2", "2"]
////        default:
////            array = []
////        }
//        let routine = api?.fetchRoutines()
//        print(routine?.first)
        if let routines = api?.fetchRoutines(){
            let routinesEntities = RoutineEntity.make(routines)
            presenter?.sendRoutines(routinesEntities)
        }
    }
}
