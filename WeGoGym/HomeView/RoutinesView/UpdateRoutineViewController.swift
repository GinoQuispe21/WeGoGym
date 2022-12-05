//
//  UpdateRoutineViewController.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 5/12/22.
//

import UIKit

class UpdateRoutineViewController: UIViewController {

    @IBAction func closeUpdateRoutineButtontItem(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func SaveUpdateRoutineButtonItem(_ sender: Any) {
        let alert = UIAlertController(title: "Actualizar Rutina", message: "¿Estás seguro de actualizar esta rutina?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { action in
            print("cancelar")
        }))
        alert.addAction(UIAlertAction(title: "Actualizar", style: .default, handler: { action in
            print("actualizado")
            self.dismiss(animated: true)
        }))
        present(alert, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
