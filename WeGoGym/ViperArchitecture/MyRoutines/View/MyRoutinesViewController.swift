//
//  MyRoutinesViewController.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 13/12/22.
//

import UIKit

protocol MyRoutinesViewControllerProtocol {
    func reciveData(_ array: [RoutineEntity])
}

class MyRoutinesViewController: UIViewController {

    var presenter: MyRoutinesPresenterProtocol?
    var myRoutines: [RoutineEntity] = []
    
    @IBOutlet weak var myRoutinesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("pedimos rutinas a presenter")
        presenter?.giveRoutines(2)
        myRoutinesTableView.dataSource = self
        let nib = UINib(nibName: "RoutineTableViewCell", bundle: nil)
        myRoutinesTableView.register(nib, forCellReuseIdentifier: "routineCell")
    }
}

extension MyRoutinesViewController : UITableViewDataSource {
    
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
}

extension MyRoutinesViewController: MyRoutinesViewControllerProtocol {
    func reciveData(_ array: [RoutineEntity]) {
//        print("recibimos los datos del presenter en el view")
//        print(array)
        self.myRoutines = array
    }
}
