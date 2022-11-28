//
//  ViewController.swift
//  WeGoGym
//
//  Created by Gino Salvador Quispe Calixto on 25/11/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("HOLA")
    }
    @IBAction func signUp(_ sender: UIButton) {
        print("Sign Up")
        performSegue(withIdentifier: "signUpSegue", sender: nil)
    }
    @IBAction func signIn(_ sender: UIButton) {
        print("Sign In")
        performSegue(withIdentifier: "signInSegue", sender: nil)
    }
}

