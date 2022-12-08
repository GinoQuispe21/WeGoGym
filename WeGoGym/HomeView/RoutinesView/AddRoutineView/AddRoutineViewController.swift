//
//  AddRoutineViewController.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 4/12/22.
//

import UIKit

protocol AddRoutineViewControllerDelegate {
    func addRoutineViewControllerDelegate(_ viewController: UIViewController, didCreateRoutine newRoutine: Routine)
}

class AddRoutineViewController: UIViewController {
    
    var excercisesAddedArray : [Excercise] = []
    
    let allExcercises : [Excercise] = [
        Excercise(name: "Press de Banca", description: "bonito ejercicio", muscle: "Pectoral", series: 0, reps: 0),
        Excercise(name: "Press de Banca", description: "bonito ejercicio", muscle: "Pectoral", series: 0, reps: 0),
        Excercise(name: "Press de Banca", description: "bonito ejercicio", muscle: "Pectoral", series: 0, reps: 0),
        Excercise(name: "Press de Banca", description: "bonito ejercicio", muscle: "Pectoral", series: 0, reps: 0),
        Excercise(name: "Press de Banca", description: "bonito ejercicio", muscle: "Pectoral", series: 0, reps: 0),
        Excercise(name: "Press de Banca", description: "bonito ejercicio", muscle: "Pectoral", series: 0, reps: 0),
        Excercise(name: "Press de Banca", description: "bonito ejercicio", muscle: "Pectoral", series: 0, reps: 0),
        Excercise(name: "Press de Banca", description: "bonito ejercicio", muscle: "Pectoral", series: 0, reps: 0),
        Excercise(name: "Press de Banca", description: "bonito ejercicio", muscle: "Pectoral", series: 0, reps: 0),
        Excercise(name: "Press de Banca", description: "bonito ejercicio", muscle: "Pectoral", series: 0, reps: 0),
        Excercise(name: "Press de Banca", description: "bonito ejercicio", muscle: "Pectoral", series: 0, reps: 0),
        Excercise(name: "Press de Banca", description: "bonito ejercicio", muscle: "Pectoral", series: 0, reps: 0),
        Excercise(name: "Press de Banca", description: "bonito ejercicio", muscle: "Pectoral", series: 0, reps: 0),
        Excercise(name: "Press de Banca", description: "bonito ejercicio", muscle: "Pectoral", series: 0, reps: 0),
        Excercise(name: "Press de Banca", description: "bonito ejercicio", muscle: "Pectoral", series: 0, reps: 0),
        Excercise(name: "Press de Banca", description: "bonito ejercicio", muscle: "Pectoral", series: 0, reps: 0),
        Excercise(name: "Press de Banca", description: "bonito ejercicio", muscle: "Pectoral", series: 0, reps: 0),
        Excercise(name: "Press de Banca", description: "bonito ejercicio", muscle: "Pectoral", series: 0, reps: 0),
    ]

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descTextField: UITextField!
    @IBOutlet weak var searchExcerciseTextField: UITextField!
    @IBAction func closeBarButtonItem(_ sender: Any) {dismiss(animated: true)}
    @IBOutlet weak var excercisesAddedCollectionView: UICollectionView!
    @IBOutlet weak var excercisesTableView: UITableView!
    @IBAction func SaveBarButtonItem(_ sender: UIBarButtonItem) {
        
        let name = nameTextField.text
        let desc = descTextField.text
        
        guard let na = name, let de = desc, !na.isEmpty, !de.isEmpty else {return}
        
        let author = "mi"
        let time = 0
        let excercies : [Excercise] = []
        let countExcercies = excercies.count
        
        let routine = Routine(name: na, desciption: de, author: author, time: time, excercies: excercies, countExc: countExcercies)
        
        delegate?.addRoutineViewControllerDelegate(self, didCreateRoutine: routine)
        
        dismiss(animated: true)
    }
    
    var delegate : AddRoutineViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        excercisesTableView.dataSource = self
        
        excercisesAddedCollectionView.dataSource = self
        excercisesAddedCollectionView.delegate = self
        
        nameTextField.placeholder = "Nombre de la Rutina"
        descTextField.placeholder = "Descripción de la rutina"
        searchExcerciseTextField.placeholder = "Buscar un ejercicio por nombre o grupo muscular"
    }

}

// CollectionView

extension AddRoutineViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if excercisesAddedArray.count == 0 {
            excercisesAddedCollectionView.setEmptyView(message: "Agrega ejercicios a tu rutina en la secciòn abajo")
        } else {
            excercisesAddedCollectionView.restore()
        }
        return excercisesAddedArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "excerciseAddedCollectionViewCell", for: indexPath) as? ExcerciseAddedCollectionViewCell else {return UICollectionViewCell()}
        cell.setupValues(excercise: excercisesAddedArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 100)
    }
}

// TalbeViewController

extension AddRoutineViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allExcercises.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "execerciseListTableViewCell", for: indexPath) as? ExecerciseListTableViewCell else {return UITableViewCell()}
        cell.setupValues(excercise: allExcercises[indexPath.row])
        return cell
    }
}

extension UICollectionView {
    func setEmptyView(message: String) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        let messageLabel = UILabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 15)
        emptyView.addSubview(messageLabel)
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
        messageLabel.topAnchor.constraint(equalTo: emptyView.topAnchor, constant: 30).isActive = true
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        // The only tricky part is here:
        self.backgroundView = emptyView
    }
    func restore() {
        self.backgroundView = nil
    }
}
