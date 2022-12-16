//
//  CreateRoutinePresenter.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 14/12/22.
//

import Foundation
import UIKit

protocol CreateRoutinePresenterProtocol {
    func sendRoutines(_ arrayAllExercises: [ExerciseEntity])
    func getAllExercises()
    func closeModal()
    func addRoutine(name: String?, description: String?, excercises: [ExcerciseStruct]?)
    func addExcerciseToRoutine(nameExerciseLabel: String, muscleExerciseLabel: String)
    func reciveNewExerciseToRoutine(_ newExercise: ExcerciseStruct)
    func deleteExerciseToRoutine(_ indexCell: Int)
    func reciveConfirmationDelete(_ indexCell: Int)
    func showViewBehindCollectionView( elements: Int, exercisesAddedCollectionView: UICollectionView)
    func showAlertUpdate(_ indexCell: Int)
    func reciveUpdatedExercise(_ seriesToUpdate: Int,_ repsToUpdate: Int,_ indexCell: Int)
}

class CreateRoutinePresenter {
    
    var view: CreateRoutineViewControllerProtocol?
    var router: CreaterRoutineRouterProtocol?
    var interactor: CreateRoutineInteractorProtocol?
    private var auxArrayExercises : [ExcerciseStruct] = []
    
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
    
    func addExcerciseToRoutine(nameExerciseLabel: String, muscleExerciseLabel: String) {
        router?.showAlertAddRoutine(nameExerciseLabel: nameExerciseLabel, muscleExerciseLabel: muscleExerciseLabel)
    }
    
    func reciveNewExerciseToRoutine(_ newExercise: ExcerciseStruct) {
//        counExcercisesLabel.text = "\(excercisesAddedArray.count) ejercicios"
        self.auxArrayExercises.append(newExercise)
        view?.updateArrayExercise(auxArrayExercises, auxArrayExercises.count)
    }
    
    func deleteExerciseToRoutine(_ indexCell: Int) {
        router?.showAlertDeleteExercise(indexCell)
    }
    
    func reciveConfirmationDelete(_ indexCell: Int) {
        self.auxArrayExercises.remove(at: indexCell)
        view?.updateArrayExercise(auxArrayExercises, auxArrayExercises.count)
    }
    func showViewBehindCollectionView(elements: Int, exercisesAddedCollectionView: UICollectionView) {
        if elements == 0 {
            exercisesAddedCollectionView.setEmptyView(message: "Agrega ejercicios a tu rutina en la secciòn abajo")
        } else {
            exercisesAddedCollectionView.restore()
        }
    }
    
    func showAlertUpdate(_ indexCell: Int) {
        router?.showAlertUpdate(auxArrayExercises[indexCell].series, auxArrayExercises[indexCell].reps, indexCell)
    }
    
    func reciveUpdatedExercise(_ seriesToUpdate: Int,_ repsToUpdate:Int,_ indexCell:Int) {
        self.auxArrayExercises[indexCell].series = seriesToUpdate
        self.auxArrayExercises[indexCell].reps = repsToUpdate
        view?.updateArrayExercise(auxArrayExercises, auxArrayExercises.count)
    }
}


