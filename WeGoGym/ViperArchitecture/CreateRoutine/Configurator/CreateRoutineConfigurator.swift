//
//  CreateRoutineConfigurator.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 14/12/22.
//

import Foundation
import UIKit

public protocol CreateRoutineConfiguratorDelegate {
//    aca deberiamos mandar viewController: UIVIEWCONTROLLER segun video de franti
    func createRoutineConfiguratorDelegate(didCreate nameRoutine: RoutineEntity)
}

public class CreateRoutineConfigurator {
    
    public var delegate: CreateRoutineConfiguratorDelegate?
    
    func make() -> UIViewController {
        
        let api = AllExercisesAPI()
        let presenter = CreateRoutinePresenter()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "createRoutineViewController") as? CreateRoutineViewController else {
            return UIViewController()
        }
        let interactor = CreateRoutineInteractor(api: api, presenter: presenter)
//        no se puede acceder al delegate por el constructor xq estoy en un metodo de clase
        let router = CreateRoutineRouter(view: viewController, delegate: delegate!)
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router 
        
        return viewController
    }
    
}
