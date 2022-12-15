//
//  CreateRoutineRouter.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 14/12/22.
//

import Foundation
import UIKit

protocol CreaterRoutineRouterProtocol {
    func closeViewController()
    func showCreateRoutineAlert(name: String, description: String, time: Int, countExercises: Int, excercises: [ExcerciseStruct])
    func showAlertEmptyInputs()
}

class CreateRoutineRouter {
    var view: UIViewController?
    var delegate: CreateRoutineConfiguratorDelegate
    
    required init(view: UIViewController, delegate: CreateRoutineConfiguratorDelegate) {
        self.view = view
        self.delegate = delegate
    }
}

extension CreateRoutineRouter: CreaterRoutineRouterProtocol {
    
    func showCreateRoutineAlert(name: String, description: String, time: Int, countExercises: Int, excercises: [ExcerciseStruct]) {
        print("aqui vamos a hacer tu alert")
        view?.dismiss(animated: true)
        let newRoutine = RoutineEntity(name: name, description: description, author: "mi", time: time, exercises: excercises)
        delegate.createRoutineConfiguratorDelegate(didCreate: newRoutine)
    }
    
    func closeViewController() {
        view?.dismiss(animated: true)
    }
    
    func showAlertEmptyInputs() {
        let alert = UIAlertController(title: "Datos incompletos", message: "Validar que los datos solicitados esten completos para registrar su nueva rutina", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Aceptar", style: .default))
        view?.present(alert, animated: true)
    }
}
