//
//  AddRoutineViewController.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 4/12/22.
//

import UIKit

protocol AddRoutineViewControllerDelegate {
    func addRoutineViewControllerDelegate(_ viewController: UIViewController, didCreateRoutine newRoutine: Routine)
}

class AddRoutineViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    @IBAction func closeBarButtonItem(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBAction func SaveBarButtonItem(_ sender: UIBarButtonItem) {
        
        let name = nameTextField.text
        let desc = descTextField.text
        
        guard let na = name, let de = desc, !na.isEmpty, !de.isEmpty else {return}
        
        let author = "mi"
        let time = 0
        let excercies : [Excercise] = []
        let countExcercies = excercies.count
        
        let routine = Routine(name: na, desciption: de, author: author, time: time, excercies: excercies, countExc: countExcercies)
        
        delegate?.addRoutineViewControllerDelegate(self, didCreateRoutine: routine)
        
        dismiss(animated: true)
    }
    
    var delegate : AddRoutineViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.placeholder = "Nombre de la Rutina"
        descTextField.placeholder = "Descripción de la rutina"
    }

}
