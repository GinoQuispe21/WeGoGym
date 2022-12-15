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
    func addRoutine(name: String?, description: String?, excercises: [ExcerciseStruct]?)
}

class CreateRoutinePresenter {
    
    var view: CreateRoutineViewControllerProtocol?
    var router: CreaterRoutineRouterProtocol?
    var interactor: CreateRoutineInteractorProtocol? 
    
}

extension CreateRoutinePresenter : CreateRoutinePresenterProtocol {
    func addRoutine(name: String?, description: String?, excercises: [ExcerciseStruct]?){
        if let nameAux = name, let descrAux = description, let exceAux = excercises, !nameAux.isEmpty, !descrAux.isEmpty, !exceAux.isEmpty {
//            validar si no estan vacios los inputs
            let counAux = exceAux.count
            let timeAux = counAux * 15
            router?.showCreateRoutineAlert(name: nameAux, description: descrAux, time: timeAux, countExercises: counAux, excercises: exceAux)
        } else {
            router?.showAlertEmptyInputs()
        }
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


