//
//  MyRoutinesViewController.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 13/12/22.
//

import UIKit

protocol MyRoutinesViewControllerProtocol {
    func reciveData(_ array: [RoutineEntity])
    func getNewRoutine(_ nameRoutine: String)
}

class MyRoutinesViewController: UIViewController {

    var presenter: MyRoutinesPresenterProtocol?
    var myRoutines: [RoutineEntity] = []
    
    @IBOutlet private weak var myRoutinesTableView: UITableView!
    @IBAction private func addRoutineButton(_ sender: UIButton) {
        presenter?.showAddRoutineViewController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("pedimos rutinas a presenter")
        presenter?.giveRoutines(2)
        
        myRoutinesTableView.dataSource = self
        myRoutinesTableView.delegate = self
        
        let nib = UINib(nibName: "RoutineTableViewCell", bundle: nil)
        myRoutinesTableView.register(nib, forCellReuseIdentifier: "routineCell")
    }
}

extension MyRoutinesViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return myRoutines.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "routineCell", for: indexPath) as? RoutineTableViewCell else {return UITableViewCell()}
        let routine = myRoutines[indexPath.section]
        cell.setupEntity(routine)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let routine = myRoutines[indexPath.section]
        presenter?.showDetailOfRoutineSelected(routine)
    }
}

extension MyRoutinesViewController: MyRoutinesViewControllerProtocol {
    func getNewRoutine(_ nameRoutine: String) {
        print("hola mi querido chupapimuñaño \(nameRoutine)")
    }
    
    func reciveData(_ array: [RoutineEntity]) {
//        print("recibimos los datos del presenter en el view")
//        print(array)
        self.myRoutines = array
    }
}
