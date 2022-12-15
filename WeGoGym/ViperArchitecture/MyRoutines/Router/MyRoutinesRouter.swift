//
//  MyRoutinesRouter.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 13/12/22.
//

import Foundation
import UIKit

protocol MyRoutineRouterProtocol {
    func reciveRoutines(_ array: [RoutineEntity])
    func showDetailView(_ routine: RoutineEntity)
    func showAddRoutineView()
}

class MyRoutineRouter : MyRoutineRouterProtocol{
    
    var createRoutineConfigurator: CreateRoutineConfigurator?
    let presenter: MyRoutinesPresenterProtocol?
    var view: UIViewController?
    
    required init(presenter: MyRoutinesPresenterProtocol, view: UIViewController) {
        self.presenter = presenter
        self.view = view
    }
    
    func reciveRoutines(_ array: [RoutineEntity]) {
//        print(">>>> Mi routine response en Router:  \(array)")
//        let viewController = UIViewController()
//        view?.present(viewController, animated: true)
        
//        NO DEBE SER DEPENTIENDE A CLASES CONCRETAS -> LISKOV
//        let detail = RoutineDetail(name: array.first!.name)
//        let detailRoutineViewController = DetailConfigurator.make(detail)
//        view?.present(detailRoutineViewController, animated: true)
    }
    
    func showDetailView(_ routine: RoutineEntity){
        let detail = RoutineDetail(name: routine.name, author: routine.author,description: routine.description, countExcercises: routine.exercises.count, time: routine.time, excercies: routine.exercises)
        let detailRoutineViewController = DetailConfigurator.make(detail)
        
//        let nav = UINavigationController(rootViewController: detailRoutineViewController)
//        let destination = nav.viewControllers.first as? DetailRoutineViewController
        
//        view?.present(nav, animated: true)
        
//        view?.present(detailRoutineViewController, animated: true)
        view?.navigationController?.pushViewController(detailRoutineViewController, animated: true)
    }
    func showAddRoutineView() {
        print("ahora presentamos la add rutina view controller")
        createRoutineConfigurator = CreateRoutineConfigurator()
//        paso 3
        createRoutineConfigurator?.delegate = self
        if let createViewController = createRoutineConfigurator?.make() {
            let nav = UINavigationController(rootViewController: createViewController)
            view?.present(nav, animated: true)
        }
    }
}

// 1. adopoto el protocolo

extension MyRoutineRouter: CreateRoutineConfiguratorDelegate {
    //    2. implementar metodos
    func createRoutineConfiguratorDelegate(didCreate nameRoutine: RoutineEntity) {
        presenter?.reciveNewRoutine(nameRoutine)
    }
}
