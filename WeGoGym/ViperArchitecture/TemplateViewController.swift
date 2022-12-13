//
//  TemplateViewController.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 12/12/22.
//

import UIKit

class TemplateViewController: UIViewController {

    @IBAction func openMyRoutines(_ sender: UIButton) {
        let myRoutinesViewController = MyRoutinesConfigurator.make()
        navigationController?.pushViewController(myRoutinesViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}
