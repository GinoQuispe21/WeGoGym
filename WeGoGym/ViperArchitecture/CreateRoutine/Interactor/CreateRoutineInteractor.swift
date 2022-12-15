//
//  CreateRoutineInteractor.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 14/12/22.
//

import Foundation

protocol CreateRoutineInteractorProtocol {
    func allExcercises()
}

class CreateRoutineInteractor {
    
    var api: ExerciseRepository?
    var presenter : CreateRoutinePresenterProtocol?
    
    required init(api: ExerciseRepository, presenter: CreateRoutinePresenterProtocol) {
        self.api = api
        self.presenter = presenter
    }
}

extension CreateRoutineInteractor : CreateRoutineInteractorProtocol {
    func allExcercises() {
        if let allExercises = api?.fetchAllExercises() {
            let allExercisesEntities = ExerciseEntity.make(allExercises)
            presenter?.sendRoutines(allExercisesEntities)
        }
    }
}
