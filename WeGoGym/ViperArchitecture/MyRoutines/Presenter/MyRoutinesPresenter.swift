//
//  MyRoutinesPresenter.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 13/12/22.
//

import Foundation

protocol MyRoutinesPresenterProtocol : AnyObject {
    func giveRoutines(_ newRoutineArray: [RoutineEntity])
    func sendRoutines(_ array: [RoutineEntity])
    func showDetailOfRoutineSelected(_ routine: RoutineEntity)
    func showAddRoutineViewController()
    func reciveNewRoutine(_ nameRoutine: RoutineEntity)
    func showAlertDeleteRoutine(_ index: Int)
    func confirmDeleteRoutine(_ index: Int)
}

class MyRoutinesPresenter : MyRoutinesPresenterProtocol{
    
    private var array: [RoutineEntity] = []
    var router: MyRoutineRouterProtocol?
    var interactor: MyRoutinesInteractorProtocol?
    var view: MyRoutinesViewControllerProtocol?
    
    func giveRoutines(_ newRoutineArray: [RoutineEntity]) {
        interactor?.reciveDataFromApi()
    }
    
    func sendRoutines(_ array: [RoutineEntity]){
        self.array = array
        view?.reciveData(array)
    }
    
    func showDetailOfRoutineSelected(_ routine: RoutineEntity) {
        router?.showDetailView(routine)
    }
    
    func showAddRoutineViewController() {
        router?.showAddRoutineView()
    }
    
//    func reciveNewRoutine(_ nameRoutine: RoutineEntity) {
    func reciveNewRoutine(_ nameRoutine: RoutineEntity) {
        self.array.append(nameRoutine)
        view?.getNewRoutine(array)
//        view?.getNewRoutine(nameRoutine)
    }
    
    func showAlertDeleteRoutine(_ index: Int) {
        router?.showDeleteRoutineAlert(index)
    }
    
    func confirmDeleteRoutine(_ index: Int) {
        self.array.remove(at: index)
        view?.getNewRoutine(array)
    }
    
}
