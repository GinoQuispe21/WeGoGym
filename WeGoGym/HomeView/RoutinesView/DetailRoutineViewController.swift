//
//  DetailRoutineViewController.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 4/12/22.
//

import UIKit

class DetailRoutineViewController: UIViewController {

    var routine : Routine?
    var exercises : [Excercise]? = []
    
    @IBOutlet weak var nameRoutineLabel: UILabel!
    @IBOutlet weak var descRoutineLabel: UILabel!
    @IBOutlet weak var countExcLabel: UILabel!
    @IBOutlet weak var timeRoutineLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameRoutineLabel.text = routine?.name
        descRoutineLabel.text = routine?.desciption
        if let count = routine?.countExc {
            countExcLabel.text = "\(String(count)) Ejercicios"
        }
        if let time = routine?.time {
            timeRoutineLabel.text = "\(String(time)) Minutos"
        }
        exercises = routine?.excercies
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
