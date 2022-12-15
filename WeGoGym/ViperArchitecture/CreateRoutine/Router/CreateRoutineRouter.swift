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
    func showCreateRoutineAlert()
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
    func showCreateRoutineAlert() {
        print("aqui vamos a hacer tu alert y la otra wbda")
        view?.dismiss(animated: true)
        let au = "au"
        delegate.createRoutineConfiguratorDelegate(didCreate: au)
    }
    
    func closeViewController() {
        view?.dismiss(animated: true)
    }
}
