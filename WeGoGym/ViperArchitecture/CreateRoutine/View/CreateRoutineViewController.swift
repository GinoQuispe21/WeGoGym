//
//  CreateRoutineViewController.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 14/12/22.
//

import UIKit

protocol CreateRoutineViewControllerProtocol {
    func reciveRoutines(_ arrayAllExercises: [ExerciseEntity])
}

class CreateRoutineViewController: UIViewController {
    
    var arrayTableView : [ExerciseEntity] = []
    var presenter: CreateRoutinePresenterProtocol?
    
    @IBAction private func closeCreateRoutineButton(_ sender: UIBarButtonItem) {
        presenter?.closeModal()
    }
    
    @IBAction func createeRoutineButton(_ sender: UIBarButtonItem) {
        presenter?.addRoutine()
    }
    
    @IBOutlet weak var nameRoutineTextField: UITextField!
    @IBOutlet weak var descriptionRoutineTextField: UITextField!
    @IBOutlet weak var exercisesAddedCollectionView: UICollectionView!
    @IBOutlet weak var allExercisesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameRoutineTextField.placeholder = "Nombre de la rutina"
        descriptionRoutineTextField.placeholder = "Descripción de la rutina"
        allExercisesTableView.dataSource = self
        exercisesAddedCollectionView.dataSource = self
        presenter?.getAllExercises()
    }

}

extension CreateRoutineViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "createRoutineCollectionViewCell", for: indexPath) as? CreateRoutineCollectionViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 100)
    }
}


extension CreateRoutineViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayTableView.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "createRoutineExerciseTableViewCell") as? CreateRoutineExerciseTableViewCell else {
            return UITableViewCell()
        }
        cell.setupValues(arrayTableView[indexPath.row])
        return cell
    }
}

extension CreateRoutineViewController : CreateRoutineViewControllerProtocol {
    func reciveRoutines(_ arrayAllExercises: [ExerciseEntity]) {
        self.arrayTableView = arrayAllExercises
    }
}
