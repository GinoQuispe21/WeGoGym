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
}

class MyRoutineRouter : MyRoutineRouterProtocol{
    
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
    }
    
}
