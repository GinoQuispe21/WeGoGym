//
//  ExcerciseAddedCollectionViewCell.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 7/12/22.
//

import UIKit

protocol ExcerciseRoutineDetailCollectionViewCellDelegate : AnyObject {
    func excerciseAddedCollectionViewCell(_ collectionViewCell: UICollectionViewCell, didRemoveCell cell: ExcerciseAddedCollectionViewCell, index: Int)
}

class ExcerciseAddedCollectionViewCell: UICollectionViewCell {
    
    var viewController : UIViewController?
    var excerciseCell : Excercise?
    var indexCell : Int = 0
    weak var delegate : ExcerciseRoutineDetailCollectionViewCellDelegate?
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var seriesLabel: UILabel!
    @IBOutlet weak var repsLabel: UILabel!
    
    @IBAction func deleteExcerciseButton(_ sender: UIButton) {
        let alert = UIAlertController(title: "Eliminar Ejercicio", message: "¿Estás seguro de eliminar esta ejercicio?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { action in
        }))
        alert.addAction(UIAlertAction(title: "Eliminar", style: .destructive, handler: { action in
            self.delegate?.excerciseAddedCollectionViewCell(self, didRemoveCell: self, index: self.indexCell)
        }))
        viewController?.present(alert, animated: true)
    }
    
    @IBAction func updateExcerciseButton(_ sender: UIButton) {
    }
    
    
    func setupValues(excercise: Excercise){
        nameLabel.text = excercise.name
        seriesLabel.text = "\(excercise.series) series"
        repsLabel.text = "\(excercise.reps) reps"
    }
    
}
