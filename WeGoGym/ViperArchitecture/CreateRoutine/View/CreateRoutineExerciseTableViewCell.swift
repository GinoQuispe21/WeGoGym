//
//  ExerciseTableViewCell.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 14/12/22.
//

import UIKit

class CreateRoutineExerciseTableViewCell: UITableViewCell {

    var presenter: CreateRoutinePresenterProtocol?
    
    @IBOutlet weak var nameExerciseLabel: UILabel!
    @IBOutlet weak var muscleExerciseLabel: UILabel!
    @IBAction func addExerciseToRoutineButton(_ sender: UIButton) {
        presenter?.addExcerciseToRoutine(nameExerciseLabel: nameExerciseLabel.text!, muscleExerciseLabel: muscleExerciseLabel.text!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func setupValues(_ exercise: ExerciseEntity){
        nameExerciseLabel.text = exercise.name
        muscleExerciseLabel.text = exercise.muscle
    }

}
