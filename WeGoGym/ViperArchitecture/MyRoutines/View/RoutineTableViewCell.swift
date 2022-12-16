//
//  RoutineTableViewCell.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 4/12/22.
//

import UIKit

class RoutineTableViewCell: UITableViewCell {

    weak var presenter : MyRoutinesPresenterProtocol?
    var index: Int = 0
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var authorLabel: UILabel!
    @IBOutlet var countExcerciseLabel: UILabel!
    @IBOutlet var timeRoutineLabel: UILabel!
    @IBOutlet var routineImageView: UIImageView!
    @IBAction func deleteButton(_ sender: UIButton) {
        print(index)
        presenter?.showAlertDeleteRoutine(index)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupLabels(name: String, author: String, countExc: Int, timeExc: Int){
        nameLabel.text = name
        authorLabel.text = "Creado por \(author)"
        countExcerciseLabel.text = "\(String(countExc)) Ejercicios"
        timeRoutineLabel.text = "\(String(timeExc)) minutos"
    }
    
    func setupEntity(_ routine: RoutineEntity) {
        nameLabel.text = routine.name
        authorLabel.text = "Creado por \(routine.author)"
        countExcerciseLabel.text = "\(routine.exercises.count) Ejercicios"
        timeRoutineLabel.text = "\(String(routine.time)) minutos"
    }
}
