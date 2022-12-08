//
//  ExecerciseListTableViewCell.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 7/12/22.
//

import UIKit

class ExecerciseListTableViewCell: UITableViewCell {

    var excerciseToAdd : Excercise?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var muscleLabel: UILabel!
    
    @IBAction func addToRoutineButton(_ sender: UIButton) {
        print("u want to add a routine right????")
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
