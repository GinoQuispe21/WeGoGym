//
//  CreateRoutineViewController.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 14/12/22.
//

import UIKit

protocol CreateRoutineViewControllerProtocol {
    func reciveRoutines(_ arrayAllExercises: [ExerciseEntity])
    func reciveNewExercise(_ newArrayExercisesAdded: [ExcerciseStruct])
    func deleteExercise(_ newArrayExerciseDeleted: [ExcerciseStruct])
}

class CreateRoutineViewController: UIViewController {
    
    private var arrayExercises : [ExcerciseStruct] = []
    private var arrayTableView : [ExerciseEntity] = []
    
    var presenter: CreateRoutinePresenterProtocol?
    
    @IBAction private func closeCreateRoutineButton(_ sender: UIBarButtonItem) {
        presenter?.closeModal()
    }
    
    @IBAction func createeRoutineButton(_ sender: UIBarButtonItem) {
        presenter?.addRoutine(name: nameRoutineTextField.text, description: descriptionRoutineTextField.text, excercises: arrayExercises)
    }
    
    @IBOutlet weak private var nameRoutineTextField: UITextField!
    @IBOutlet weak private var descriptionRoutineTextField: UITextField!
    @IBOutlet weak private var exercisesAddedCollectionView: UICollectionView!
    @IBOutlet weak private var allExercisesTableView: UITableView!
    
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
        return arrayExercises.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "createRoutineCollectionViewCell", for: indexPath) as? CreateRoutineCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.presenter = presenter
        cell.indexCell = indexPath.row
        cell.setupLabels(arrayExercises[indexPath.row])
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
        cell.presenter = presenter
        cell.setupValues(arrayTableView[indexPath.row])
        return cell
    }
}

extension CreateRoutineViewController : CreateRoutineViewControllerProtocol {
    
    func reciveNewExercise(_ newArrayExercisesAdded: [ExcerciseStruct]) {
        self.arrayExercises = newArrayExercisesAdded
        self.exercisesAddedCollectionView.reloadData()
    }
    
    func deleteExercise(_ newArrayExerciseDeleted: [ExcerciseStruct]) {
        self.arrayExercises = newArrayExerciseDeleted
        self.exercisesAddedCollectionView.reloadData()
    }
    
    func reciveRoutines(_ arrayAllExercises: [ExerciseEntity]) {
        self.arrayTableView = arrayAllExercises
    }
}
