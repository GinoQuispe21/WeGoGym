//
//  FirstScreenViewController.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 28/11/22.
//

import UIKit

class FirstScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInValidate(_ sender: UIButton) {
        print("Sign In Validator!")
        performSegue(withIdentifier: "signInValidateSegue", sender: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
