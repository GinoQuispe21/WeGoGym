//
//  RoutinesViewController.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 4/12/22.
//

import UIKit

class RoutinesViewController: UIViewController {

    var routines = ["Rutina de piernas", "Rutinas de pecho", "Espalda a muerte", "Hombros y brazos", "Rutina de piernas", "Rutinas de pecho", "Espalda a muerte", "Hombros y brazos", "Rutinas de pecho", "Espalda a muerte", "Hombros y brazos"]
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var routinesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.placeholder = "Buscar rutina"
        let nib = UINib(nibName: "RoutineTableViewCell", bundle: nil)
        routinesTableView.register(nib, forCellReuseIdentifier: "routineCell")
        routinesTableView.delegate = self
        routinesTableView.dataSource = self
    }

}

extension RoutinesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return routines.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "routineCell", for: indexPath) as? RoutineTableViewCell else {return UITableViewCell()}
        let name = routines[indexPath.section]
        cell.setupLabels(name: name, author: "Entrenador Pepe", countExc: 5, timeExc: 120)
        return cell
    }
}
