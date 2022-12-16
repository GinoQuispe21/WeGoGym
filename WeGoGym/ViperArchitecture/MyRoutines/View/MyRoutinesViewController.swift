//
//  MyRoutinesViewController.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 13/12/22.
//

import UIKit

protocol MyRoutinesViewControllerProtocol {
    func reciveData(_ array: [RoutineEntity])
    func getNewRoutine(_ newRoutineArray: [RoutineEntity])
    func updateRoutinesSearched(_ arrayExercises: [RoutineEntity])
}

class MyRoutinesViewController: UIViewController {

    var presenter: MyRoutinesPresenterProtocol?
    var myRoutines: [RoutineEntity] = []
    var backup: [RoutineEntity] = []
    
    @IBOutlet private weak var myRoutinesTableView: UITableView!
    @IBAction private func addRoutineButton(_ sender: UIButton) {
        presenter?.showAddRoutineViewController()
    }
    @IBOutlet weak var routineSearchBar: UISearchBar!
    
    override func viewWillAppear(_ animated: Bool) {
//        navigationItem.hidesBackButton = true
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.giveRoutines(myRoutines)
        myRoutinesTableView.dataSource = self
        myRoutinesTableView.delegate = self
        routineSearchBar.delegate = self
        
        let nib = UINib(nibName: "RoutineTableViewCell", bundle: nil)
        myRoutinesTableView.register(nib, forCellReuseIdentifier: "routineCell")
    }
}

extension MyRoutinesViewController : UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        presenter?.showViewBehindTableView(backup.count, myRoutinesTableView)
        return backup.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "routineCell", for: indexPath) as? RoutineTableViewCell else {return UITableViewCell()}
        let routine = backup[indexPath.section]
        cell.index = indexPath.section
        cell.presenter = presenter
        cell.setupEntity(routine)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let routine = myRoutines[indexPath.section]
        presenter?.showDetailOfRoutineSelected(routine)
    }
}

extension MyRoutinesViewController: MyRoutinesViewControllerProtocol {
    func getNewRoutine(_ newRoutineArray: [RoutineEntity]) {
        self.myRoutines = newRoutineArray
        backup = myRoutines
        myRoutinesTableView.reloadData()
    }
    
    func reciveData(_ array: [RoutineEntity]) {
        myRoutines = array
        backup = myRoutines
    }
    func updateRoutinesSearched(_ arrayExercises: [RoutineEntity]){
        backup = arrayExercises
        myRoutinesTableView.reloadData()
    }
}

extension MyRoutinesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        presenter?.searchTextRoutineTableView(searchText, myRoutines, myRoutinesTableView)
    }
}

extension UITableView {
    func setEmptyView(title: String, message: String) {
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        messageLabel.textColor = UIColor.gray
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
        messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
        titleLabel.text = title
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
