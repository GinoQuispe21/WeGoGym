//
//  CreateRoutineViewController.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 14/12/22.
//

import UIKit

protocol CreateRoutineViewControllerProtocol {
    func reciveRoutines(_ arrayAllExercises: [ExerciseEntity])
    func updateArrayExercise(_ newArrayExercises: [ExcerciseStruct], _ countExercisesArray: Int)
}

class CreateRoutineViewController: UIViewController {
    
    private var arrayExercises : [ExcerciseStruct] = []
    private var arrayTableView : [ExerciseEntity] = []
    
    var presenter: CreateRoutinePresenterProtocol?
    
    @IBAction private func closeCreateRoutineButton(_ sender: UIBarButtonItem) {
        presenter?.closeModal()
    }
    
    @IBAction private func createeRoutineButton(_ sender: UIBarButtonItem) {
        presenter?.addRoutine(name: nameRoutineTextField.text, description: descriptionRoutineTextField.text, excercises: arrayExercises)
    }
    
    @IBOutlet weak private var nameRoutineTextField: UITextField!
    @IBOutlet weak private var descriptionRoutineTextField: UITextField!
    @IBOutlet weak private var exercisesAddedCollectionView: UICollectionView!
    @IBOutlet weak private var allExercisesTableView: UITableView!
    @IBOutlet weak private var countExerciseLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameRoutineTextField.placeholder = "Nombre de la rutina"
        descriptionRoutineTextField.placeholder = "Descripción de la rutina"
        searchTextField.placeholder = "Musuclo, nombre de ejercicio"
        allExercisesTableView.dataSource = self
        exercisesAddedCollectionView.dataSource = self
        presenter?.getAllExercises()
    }

}

extension CreateRoutineViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.showViewBehindCollectionView(elements: arrayExercises.count, exercisesAddedCollectionView: exercisesAddedCollectionView)
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
    func reciveRoutines(_ arrayAllExercises: [ExerciseEntity]) {
        self.arrayTableView = arrayAllExercises
    }
    func updateArrayExercise(_ newArrayExercises: [ExcerciseStruct], _ countExercisesArray: Int){
        countExerciseLabel.text = "\(countExercisesArray) ejercicios"
        self.arrayExercises = newArrayExercises
        self.exercisesAddedCollectionView.reloadData()
    }
}

extension UICollectionView {
    func setEmptyView(message: String) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        let messageLabel = UILabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.textColor = UIColor.gray
        emptyView.addSubview(messageLabel)
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
        messageLabel.topAnchor.constraint(equalTo: emptyView.topAnchor, constant: 50).isActive = true
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        self.backgroundView = emptyView
    }
    func restore() {
        self.backgroundView = nil
    }
}
