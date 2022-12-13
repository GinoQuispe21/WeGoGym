//
//  MyRoutinesPresenter.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 13/12/22.
//

import Foundation

protocol MyRoutinesPresenterProtocol {
    func giveRoutines(_ option: Int)
    func sendRoutines(_ array: [RoutineEntity])
}

class MyRoutinesPresenter : MyRoutinesPresenterProtocol{
    
    var router: MyRoutineRouterProtocol?
    var interactor: MyRoutinesInteractorProtocol?
    var view: MyRoutinesViewControllerProtocol?
    
    func giveRoutines(_ option: Int) {
//        print("pedimos rutinas al interactor")
        interactor?.reciveDataFromApi(option)
    }
    
    func sendRoutines(_ array: [RoutineEntity]){
//        print("mandamos los datos del presenter al view")
        view?.reciveData(array)
        router?.reciveRoutines(array)
    }
    
}
