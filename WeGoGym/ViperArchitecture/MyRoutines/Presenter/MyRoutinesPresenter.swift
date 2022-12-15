//
//  MyRoutinesPresenter.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 13/12/22.
//

import Foundation

protocol MyRoutinesPresenterProtocol {
    func giveRoutines()
    func sendRoutines(_ array: [RoutineEntity])
    func showDetailOfRoutineSelected(_ routine: RoutineEntity)
    func showAddRoutineViewController(_ myRoutines: [RoutineEntity])
    func reciveNewRoutine(_ nameRoutine: RoutineEntity)
}

class MyRoutinesPresenter : MyRoutinesPresenterProtocol{
    
    private var array: [RoutineEntity] = []
    var router: MyRoutineRouterProtocol?
    var interactor: MyRoutinesInteractorProtocol?
    var view: MyRoutinesViewControllerProtocol?
    
    func giveRoutines() {
        interactor?.reciveDataFromApi()
    }
    
    func sendRoutines(_ array: [RoutineEntity]){
//        print("mandamos los datos del presenter al view")
        view?.reciveData(array)
        router?.reciveRoutines(array)
    }
    
    func showDetailOfRoutineSelected(_ routine: RoutineEntity) {
        router?.showDetailView(routine)
    }
    
    func showAddRoutineViewController(_ myRoutines: [RoutineEntity]) {
        array = myRoutines
        router?.showAddRoutineView()
    }
    
//    func reciveNewRoutine(_ nameRoutine: RoutineEntity) {
    func reciveNewRoutine(_ nameRoutine: RoutineEntity) {
        array.append(nameRoutine)
        view?.getNewRoutine(array)
//        view?.getNewRoutine(nameRoutine)
    }
}
