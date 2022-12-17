//
//  ExerciseRoutineCollectionViewCell.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 17/12/22.
//

import UIKit

class ExerciseRoutineCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var seriesLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    
    func setupValuesEntity(excercise: ExcerciseStruct) {
        titleLabel.text = excercise.name
        seriesLabel.text = "\(String(excercise.series)) Sets"
        repsLabel.text = "\(String(excercise.reps)) Repeticiones"
    }
}
