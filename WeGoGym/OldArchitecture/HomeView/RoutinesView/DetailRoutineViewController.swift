//
//  DetailRoutineViewController.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 4/12/22.
//

import UIKit

protocol DetailRoutineViewControllerDelegate: AnyObject {
    func detailRoutineViewController(_ viewController: UIViewController, didRemoveRoutine index:Int)
}

class DetailRoutineViewController: UIViewController {

    var routine : Routine?
    var exercises : [Excercise]? = []
    var indexCell: Int = 0
    
    @IBOutlet weak var excercisesCollectionView: UICollectionView!
    @IBAction func editRoutineButton(_ sender: UIButton) {
    }
    
    @IBAction func deleteRoutineButton(_ sender: UIButton) {
        showAlert()
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Eliminar rutina", message: "¿Estás seguro de eliminar esta rutina?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: { action in
        }))
        alert.addAction(UIAlertAction(title: "Eliminar", style: .destructive, handler: { action in
            self.delegate?.detailRoutineViewController(self, didRemoveRoutine: self.indexCell)
            self.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true)
    }
    
    weak var delegate : DetailRoutineViewControllerDelegate?
    
    @IBOutlet weak var nameRoutineLabel: UILabel!
    @IBOutlet weak var descRoutineLabel: UILabel!
    @IBOutlet weak var countExcLabel: UILabel!
    @IBOutlet weak var timeRoutineLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//      For Collection View
        excercisesCollectionView.dataSource = self
        excercisesCollectionView.delegate = self
        excercisesCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
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
}

extension DetailRoutineViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let num = exercises?.count else { return 0 }
        return num
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "excerciseRoutineDetailCollectionViewCell", for: indexPath) as? ExcerciseRoutineDetailCollectionViewCell else { return UICollectionViewCell() }
        cell.setupValues(excercise: exercises?[indexPath.row] ?? Excercise(name: "", description: "", muscle: "", series: 0, reps: 0))
        return cell
    }
}

extension DetailRoutineViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}
