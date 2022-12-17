//
//  MyRoutinesConfigurator.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 13/12/22.
//

import Foundation
import UIKit

class MyRoutinesConfigurator {
    static func make() -> UIViewController {
        
        let api = MyRoutinesAPI()
        let presenter = MyRoutinesPresenter()
        
        let aux = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = aux.instantiateViewController(withIdentifier: "myRoutinesViewController") as? MyRoutinesViewController else {
            return UIViewController()
        }
        
        let interactor = MyRoutinesInteractor(presenter: presenter, api: api)
        let router = MyRoutineRouter(presenter: presenter, view: viewController)
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        return viewController
    }
}
