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
    func showAlertAddRoutine(nameExerciseLabel: String, muscleExerciseLabel: String)
    func showAlertDeleteExercise(_ indexCell: Int)
    func showAlertUpdate(_ series: Int, _ reps: Int, _ indexCell: Int)
}

class CreateRoutineRouter {
    var view: UIViewController?
    var presenter: CreateRoutinePresenterProtocol?
    var delegate: CreateRoutineConfiguratorDelegate
    
    required init(view: UIViewController, presenter: CreateRoutinePresenterProtocol ,delegate: CreateRoutineConfiguratorDelegate) {
        self.view = view
        self.presenter = presenter
        self.delegate = delegate
    }
}

extension CreateRoutineRouter: CreaterRoutineRouterProtocol {
    
    func showCreateRoutineAlert(name: String, description: String, time: Int, countExercises: Int, excercises: [ExcerciseStruct]) {
        view?.dismiss(animated: true)
        let newRoutine = RoutineEntity(name: name, description: description, author: "mi", time: time, exercises: excercises)
//        paso 3: llamada al metodo
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
    func showAlertAddRoutine(nameExerciseLabel: String, muscleExerciseLabel: String) {
        
        let alert = UIAlertController(title: "Agregar series y repeticiones", message: "Para agregar un ejercicio a su rutina debe especificar las series y rutinas", preferredStyle: .alert)
                alert.addTextField { field in
                    field.placeholder = "Cantidad de series"
                    field.returnKeyType = .next
                    field.keyboardType = .numberPad
                }
                alert.addTextField { field in
                    field.placeholder = "Cantidad de repeticiones"
                    field.returnKeyType = .continue
                    field.keyboardType = .numberPad
                }
                alert.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "Crear", style: .default, handler: { action in
                    guard let inputs = alert.textFields, inputs.count == 2 else {return}
                    let seriesField = inputs[0]
                    let repsField = inputs[1]
                    guard let series = seriesField.text, let reps = repsField.text, !series.isEmpty, !reps.isEmpty else {return}
                    let seriesToAdd = Int(series) ?? 0
                    let repsToAdd = Int(reps) ?? 0
                    let newExcercise = ExcerciseStruct(name: nameExerciseLabel, muscle: muscleExerciseLabel, series: seriesToAdd, reps: repsToAdd)
                    self.presenter?.reciveNewExerciseToRoutine(newExcercise)
                }))
        view?.present(alert, animated: true, completion: nil)
    }
    
    func showAlertDeleteExercise(_ indexCell: Int) {
        let alert = UIAlertController(title: "Eliminar Ejercicio", message: "¿Estás seguro de eliminar esta ejercicio?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { action in
        }))
        alert.addAction(UIAlertAction(title: "Eliminar", style: .destructive, handler: { action in
            self.presenter?.reciveConfirmationDelete(indexCell)
        }))
        view?.present(alert, animated: true)
    }
    
    func showAlertUpdate(_ series: Int, _ reps: Int, _ indexCell: Int){
        let alert = UIAlertController(title: "Actualizar series y repeticiones", message: "Escriba las nuevas series y repeticiones que deseé actualizar en este ejercicio seleccionado.", preferredStyle: .alert)
                alert.addTextField { field in
                    field.placeholder = "Cantidad de series"
                    field.text = String(series)
                    field.returnKeyType = .next
                    field.keyboardType = .numberPad
                }
                alert.addTextField { field in
                    field.placeholder = "Cantidad de repeticiones"
                    field.text = String(reps)
                    field.returnKeyType = .continue
                    field.keyboardType = .numberPad
                }
                alert.addAction(UIAlertAction(title: "Cancelar", style: .default, handler: nil))
                alert.addAction(UIAlertAction(title: "Actualizar", style: .default, handler: { action in
                    guard let inputs = alert.textFields, inputs.count == 2 else {return}
                    let seriesField = inputs[0]
                    let repsField = inputs[1]
                    guard let series = seriesField.text, let reps = repsField.text, !series.isEmpty, !reps.isEmpty else {return}
                    let seriesToUpdate = Int(series) ?? 0
                    let repsToUpdate = Int(reps) ?? 0
                    self.presenter?.reciveUpdatedExercise(seriesToUpdate, repsToUpdate, indexCell)
                }))
        view?.present(alert, animated: true, completion: nil)
    }
}
