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
        if let routines = api?.fetchRoutines(){
            let routinesEntities = RoutineEntity.make(routines)
            presenter?.sendRoutines(routinesEntities)
        }
    }
}
