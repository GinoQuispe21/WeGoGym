//
//  RoutineDetailConfigurator.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 13/12/22.
//

import UIKit
import Foundation

class DetailConfigurator {
    static func make(_ item: ItemRoutineDetailProtocol) -> UIViewController {
        
//        presenter
        
        let presenter = RoutineDetailPresenter(itemDetail: item)
        
//        view
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "routineDetailViewController") as? RoutineDetailViewController else {
            return UIViewController()
        }
        viewController.presenter = presenter
        
        return viewController
    }
}
