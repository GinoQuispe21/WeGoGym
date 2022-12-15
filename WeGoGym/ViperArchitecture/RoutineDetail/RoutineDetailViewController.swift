//
//  RoutineDetailViewController.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 13/12/22.
//

import UIKit

class RoutineDetailViewController: UIViewController {

    private var itemDetailRoutine : ItemRoutineDetailProtocol?
    
    var arrayExcercises: [ExcerciseStruct] = []
    var presenter: DetailRoutinePresenterProtocol?
    
    @IBOutlet private weak var titleRoutineLabel: UILabel!
    @IBOutlet weak var authorRoutineLabel: UILabel!
    @IBOutlet private weak var descriptionRoutineLabel: UILabel!
    @IBOutlet private weak var countExcercisesLabel: UILabel!
    @IBOutlet private weak var timeRoutineLabel: UILabel!
    @IBOutlet private weak var excercisesCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        excercisesCollectionView.dataSource = self
        excercisesCollectionView.delegate = self
        excercisesCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        titleRoutineLabel.text = presenter?.getName()
        authorRoutineLabel.text = presenter?.getAuthor()
        descriptionRoutineLabel.text = presenter?.getDescription()
        countExcercisesLabel.text = "\((presenter?.getCountExcercises()) ?? 00) ejercicios"
        timeRoutineLabel.text = "\(presenter?.getTime() ?? 0) minutos"
        self.arrayExcercises = presenter?.getExcercises() ?? []
    }

}

extension RoutineDetailViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayExcercises.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "excerciseDetailCollectionViewCell", for: indexPath) as? ExcerciseRoutineDetailCollectionViewCell else { return UICollectionViewCell() }
        cell.setupValuesEntity(excercise: arrayExcercises[indexPath.row])
        return cell
    }
}

extension RoutineDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}


