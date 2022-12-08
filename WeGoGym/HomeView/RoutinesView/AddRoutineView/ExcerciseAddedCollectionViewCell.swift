//
//  ExcerciseAddedCollectionViewCell.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 7/12/22.
//

import UIKit

class ExcerciseAddedCollectionViewCell: UICollectionViewCell {
    
    var excerciseCell : Excercise?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var seriesLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    
    func setupValues(excercise: Excercise){
        nameLabel.text = excercise.name
        seriesLabel.text = "\(excercise.series) series"
        repsLabel.text = "\(excercise.reps) reps"
    }
    
}
