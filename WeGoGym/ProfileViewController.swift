//
//  ProfileViewController.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 29/11/22.
//

import UIKit

class ProfileViewController: UIViewController {

//    optional
    var arrayOptions = [
        optionProfile(name: "Configuración"),
        optionProfile(name: "Métodos de Pago"),
        optionProfile(name: "Pagos Realizados"),
        optionProfile(name: "Información"),
        optionProfile(name: "Cerrar cesión")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        optionsProfile.delegate = self
        optionsProfile.dataSource = self
        // Do any additional setup after loading the view.
    }
    @IBOutlet weak var optionsProfile: UITableView!

}

extension ProfileViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 5
        return arrayOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cellProfile", for: indexPath)
//        return cell
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cellProfile", for: indexPath) as? ProfileOptionTableViewCell{
            let name = arrayOptions[indexPath.row].name
            cell.nameOption.text = name
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}
