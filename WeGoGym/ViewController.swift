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
    }
    @IBAction func signUp(_ sender: UIButton) {
        let signUpStoryboard = UIStoryboard(name: "SignUpSB", bundle: nil)
        let signUpViewController = signUpStoryboard.instantiateViewController(withIdentifier: "signUpViewController")
        navigationController?.pushViewController(signUpViewController, animated: true)
    }
    @IBAction func signIn(_ sender: UIButton) {
        let signInStoryboard = 	UIStoryboard(name: "SignInSB", bundle: nil)
        let signInViewController = signInStoryboard.instantiateViewController(withIdentifier: "signInViewController")
        navigationController?.pushViewController(signInViewController, animated: true)
    }
}

