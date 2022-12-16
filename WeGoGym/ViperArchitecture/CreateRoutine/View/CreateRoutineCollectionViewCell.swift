//
//  CreateRoutineCollectionViewCell.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 14/12/22.
//

import UIKit

class CreateRoutineCollectionViewCell: UICollectionViewCell {
    
    var presenter: CreateRoutinePresenterProtocol?
    var indexCell: Int = 0
    
    @IBOutlet private weak var nameExerciseLabel: UILabel!
    @IBOutlet private weak var seriesExerciseLabel: UILabel!
    @IBOutlet private weak var repsExercisesLabel: UILabel!
    @IBAction func deleteExerciseButton(_ sender: UIButton) {
        presenter?.deleteExerciseToRoutine(indexCell)
    }
    @IBAction func updateExerciseButton(_ sender: Any) {
        presenter?.showAlertUpdate(indexCell)
    }
    
    func setupLabels(_ exercise: ExcerciseStruct) {
        nameExerciseLabel.text = exercise.name
        seriesExerciseLabel.text = "\(String(exercise.series)) series"
        repsExercisesLabel.text = "\(String(exercise.reps)) reps"
    }
    
}
