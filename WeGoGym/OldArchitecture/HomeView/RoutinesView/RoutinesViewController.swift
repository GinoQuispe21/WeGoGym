//
//  RoutinesViewController.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 4/12/22.
//

import UIKit

class RoutinesViewController: UIViewController {

//  Initialization of array
    let excercisesArray = [
        Excercise(name: "Dominadas", description: "Las dominadas ayudan a tener mayor resistencia en los antebrazos y crecer la amplitud de la espalda", muscle: "Espalda", series: 4, reps: 10),
        Excercise(name: "Sentadillas", description: "Las dominadas ayudan a tener mayor resistencia en los antebrazos y crecer la amplitud de la espalda", muscle: "Pierna", series: 4, reps: 10),
        Excercise(name: "Press de Banca", description: "Las dominadas ayudan a tener mayor resistencia en los antebrazos y crecer la amplitud de la espalda", muscle: "Pectoral", series: 4, reps: 10),
        Excercise(name: "Press Militar", description: "Las dominadas ayudan a tener mayor resistencia en los antebrazos y crecer la amplitud de la espalda", muscle: "Hombros", series: 4, reps: 10),
        Excercise(name: "Dominadas", description: "Las dominadas ayudan a tener mayor resistencia en los antebrazos y crecer la amplitud de la espalda", muscle: "Espalda", series: 4, reps: 10),
    ]
    
    let excercisesArray1 = [
        Excercise(name: "Dominadas", description: "Las dominadas ayudan a tener mayor resistencia en los antebrazos y crecer la amplitud de la espalda", muscle: "Espalda", series: 4, reps: 10),
        Excercise(name: "Sentadillas", description: "Las dominadas ayudan a tener mayor resistencia en los antebrazos y crecer la amplitud de la espalda", muscle: "Pierna", series: 4, reps: 10),
        Excercise(name: "Press de Banca", description: "Las dominadas ayudan a tener mayor resistencia en los antebrazos y crecer la amplitud de la espalda", muscle: "Pectoral", series: 4, reps: 10),
    ]
    
    lazy var routines : [Routine] = [
        Routine(name: "Full Body Routine", desciption: "Rutina para ejercitar todo el cuerpo y mejorar interdiariamente", author: "Entreandor Pedro", time: 60, excercies: excercisesArray, countExc: excercisesArray.count),
        Routine(name: "Entrenamiento de espalda", desciption: "Rutina para ejercitar todo el cuerpo y mejorar interdiariamente", author: "Entreandor Gino", time: 60, excercies: excercisesArray1, countExc: excercisesArray1.count),
        Routine(name: "Entrenamiento de pectoral", desciption: "Rutina para ejercitar todo el cuerpo y mejorar interdiariamente", author: "Entreandor Pedro", time: 60, excercies: excercisesArray1, countExc: excercisesArray1.count),
        Routine(name: "Entrenamiento de hombros", desciption: "Rutina para ejercitar todo el cuerpo y mejorar interdiariamente", author: "Entreandor Pedro", time: 60, excercies: excercisesArray, countExc: excercisesArray.count),
        Routine(name: "Push day", desciption: "Rutina para ejercitar todo el cuerpo y mejorar interdiariamente", author: "Entreandor Miguel", time: 60, excercies: excercisesArray1, countExc: excercisesArray1.count)
    ]
    
    var backup : [Routine] = []
    
    @IBAction func addButton(_ sender: UIButton) {
    }
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var routinesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.placeholder = "Buscar rutina"
        let nib = UINib(nibName: "RoutineTableViewCell", bundle: nil)
        routinesTableView.register(nib, forCellReuseIdentifier: "routineCell")
        routinesTableView.delegate = self
        routinesTableView.dataSource = self
        backup = routines
        searchTextField.addTarget(self, action: #selector(searchTextField(_:)), for: .editingChanged)
    }

}

extension RoutinesViewController {
    @objc func searchTextField(_ textField: UITextField){
        var routinesFiltered : [Routine] = []
        if textField == searchTextField {
            let text = searchTextField.text ?? ""
            routines.forEach({ value in
                if value.name.lowercased().contains(text.lowercased()) || value.author.lowercased().contains(text.lowercased()) {
                    routinesFiltered.append(value)
                }
            })
            routines = (text.count > 0) ? routinesFiltered : backup
            routinesTableView.reloadData()
        }
    }
}

extension RoutinesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if routines.count == 0 {
            routinesTableView.setEmptyView(title: "No tienes rutinas creadas ni asignadas.", message: "Crea tu rutina o inscribete a un gimnasio y aqui verás tus rutinas")
        } else {
            routinesTableView.restore()
        }
        return routines.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "routineCell", for: indexPath) as? RoutineTableViewCell else {return UITableViewCell()}
        let name = routines[indexPath.section].name
        let author = routines[indexPath.section].author
        let countExc = routines[indexPath.section].countExc
        let time = routines[indexPath.section].time
        cell.setupLabels(name: name, author: author, countExc: countExc, timeExc: time)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let rotuine = routines[indexPath.section]
        
        let storyBoardRoutine = UIStoryboard(name: "RoutinesFeaturesSB", bundle: nil)
        
        guard let detailRoutineViewController = storyBoardRoutine.instantiateViewController(withIdentifier: "detailRoutineViewController") as? DetailRoutineViewController else {
            return
        }
        detailRoutineViewController.routine = rotuine
        detailRoutineViewController.delegate = self
        detailRoutineViewController.indexCell = indexPath.section
        navigationController?.pushViewController(detailRoutineViewController, animated: true)
        
    }
}

extension RoutinesViewController: AddRoutineViewControllerDelegate {
    func addRoutineViewControllerDelegate(_ viewController: UIViewController, didCreateRoutine newRoutine: Routine) {
        routines.append(newRoutine)
        backup = routines
        routinesTableView.reloadData()
    }
}

extension RoutinesViewController : DetailRoutineViewControllerDelegate {
    func detailRoutineViewController(_ viewController: UIViewController, didRemoveRoutine index: Int) {
        routines.remove(at: index)
        routinesTableView.reloadData()
    }
}

extension RoutinesViewController {
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nav = segue.destination as? UINavigationController
        let destination = nav?.viewControllers.first as? AddRoutineViewController
        destination?.delegate = self
    }
    
}

// Code from "https://medium.com/@mtssonmez/handle-empty-tableview-in-swift-4-ios-11-23635d108409" to add a label message when table is empty

//extension UITableView {
//    func setEmptyView(title: String, message: String) {
//        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
//        let titleLabel = UILabel()
//        let messageLabel = UILabel()
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        messageLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.textColor = UIColor.black
//        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
//        messageLabel.textColor = UIColor.lightGray
//        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
//        emptyView.addSubview(titleLabel)
//        emptyView.addSubview(messageLabel)
//        titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
//        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
//        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
//        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
//        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
//        titleLabel.text = title
//        messageLabel.text = message
//        messageLabel.numberOfLines = 0
//        messageLabel.textAlignment = .center
//        // The only tricky part is here:
//        self.backgroundView = emptyView
//        self.separatorStyle = .none
//    }
//    func restore() {
//        self.backgroundView = nil
//        self.separatorStyle = .singleLine
//    }
//}
