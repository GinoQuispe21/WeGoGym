//
//  ExecerciseListTableViewCell.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 7/12/22.
//

import UIKit

protocol ExecerciseListTableViewCellDelegate {
    func addExcercise(excercise: Excercise)
}

class ExecerciseListTableViewCell: UITableViewCell {

    var parentViewController : UIViewController?
    var excerciseToAdd : Excercise?
    var delegate : ExecerciseListTableViewCellDelegate?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var muscleLabel: UILabel!
    @IBAction func addToRoutineButton(_ sender: UIButton) {
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
//                    print("works this alert")
                    guard let inputs = alert.textFields, inputs.count == 2 else {return}
                    let seriesField = inputs[0]
                    let repsField = inputs[1]
                    guard let series = seriesField.text, let reps = repsField.text, !series.isEmpty, !reps.isEmpty else {return}
                    self.excerciseToAdd?.series = Int(series) ?? 0
                    self.excerciseToAdd?.reps = Int(reps) ?? 0
                    self.delegate?.addExcercise(excercise: self.excerciseToAdd ?? Excercise(name: "", description: "", muscle: "", series: 0, reps: 0))
                }))
        parentViewController?.present(alert, animated: true, completion: nil)
    }
    
    func showAlert() {
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupValues(excercise: Excercise) {
        excerciseToAdd = excercise
        nameLabel.text = excercise.name
        muscleLabel.text = excercise.muscle
    }
}
