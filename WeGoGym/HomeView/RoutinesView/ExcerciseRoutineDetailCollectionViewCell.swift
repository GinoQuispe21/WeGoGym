//
//  ExcerciseRoutineDetailCollectionViewCell.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 6/12/22.
//

import UIKit

class ExcerciseRoutineDetailCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var excerciseImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var seriesLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    
    func setupValues(excercise : Excercise){
        titleLabel.text = excercise.name
        seriesLabel.text = "\(String(excercise.series)) Sets"
        repsLabel.text = "\(String(excercise.reps)) Repeticiones"
    }
    
}
