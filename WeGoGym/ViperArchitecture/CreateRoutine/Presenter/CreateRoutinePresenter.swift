//
//  CreateRoutinePresenter.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 14/12/22.
//

import Foundation

protocol CreateRoutinePresenterProtocol {
    func sendRoutines(_ arrayAllExercises: [ExerciseEntity])
    func getAllExercises()
    func closeModal()
    func addRoutine()
}

class CreateRoutinePresenter {
    
    var view: CreateRoutineViewControllerProtocol?
    var router: CreaterRoutineRouterProtocol?
    var interactor: CreateRoutineInteractorProtocol? 
    
}

extension CreateRoutinePresenter : CreateRoutinePresenterProtocol {
    func addRoutine() {
        router?.showCreateRoutineAlert()
    }
    
    func sendRoutines(_ arrayAllExercises: [ExerciseEntity]) {
        view?.reciveRoutines(arrayAllExercises)
    }
    func getAllExercises() {
        interactor?.allExcercises()
    }
    func closeModal() {
        router?.closeViewController()
    }
}


