//
//  MyRoutinesRouter.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 13/12/22.
//

import Foundation
import UIKit

protocol MyRoutineRouterProtocol {
    func showDetailView(_ routine: RoutineEntity)
    func showAddRoutineView()
    func showDeleteRoutineAlert(_ index: Int)
}

class MyRoutineRouter : MyRoutineRouterProtocol{
    
    var createRoutineConfigurator: CreateRoutineConfigurator?
    let presenter: MyRoutinesPresenterProtocol?
    var view: UIViewController?
    
    required init(presenter: MyRoutinesPresenterProtocol, view: UIViewController) {
        self.presenter = presenter
        self.view = view
    }
    
    func showDetailView(_ routine: RoutineEntity){
        let detail = RoutineDetail(name: routine.name, author: routine.author,description: routine.description, countExcercises: routine.exercises.count, time: routine.time, excercies: routine.exercises)
        let detailRoutineViewController = DetailConfigurator.make(detail)
        view?.navigationController?.pushViewController(detailRoutineViewController, animated: true)
    }
    func showAddRoutineView() {
        createRoutineConfigurator = CreateRoutineConfigurator()
//        paso 3
        createRoutineConfigurator?.delegate = self
        if let createViewController = createRoutineConfigurator?.make() {
            let nav = UINavigationController(rootViewController: createViewController)
            view?.present(nav, animated: true)
        }
    }
    func showDeleteRoutineAlert(_ index: Int) {
        let alert = UIAlertController(title: "Eliminar Rutiina", message: "¿Estás seguro de eliminar esta rutina? Una vez eliminada no podra recuperarla.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { action in
        }))
        alert.addAction(UIAlertAction(title: "Eliminar", style: .destructive, handler: { action in
            self.presenter?.confirmDeleteRoutine(index)
        }))
        self.view?.present(alert, animated: true)
    }
}

// 1. adopoto el protocolo

extension MyRoutineRouter: CreateRoutineConfiguratorDelegate {
    //    2. implementar metodos
    func createRoutineConfiguratorDelegate(didCreate nameRoutine: RoutineEntity) {
        presenter?.reciveNewRoutine(nameRoutine)
    }
}
