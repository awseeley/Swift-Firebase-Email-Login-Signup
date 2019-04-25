//
//  ViewController.swift
//  FBLogin
//
//  Created by Andrew Seeley on 25/4/19.
//  Copyright © 2019 Seemu. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet var txtEmail: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    

    @IBAction func login(_ sender: Any) {
        let email = txtEmail.text!
        let password = txtPassword.text!

        Auth.auth().signIn(withEmail: email, password: password) { [weak self] user, error in
            guard let strongSelf = self else { return }
            if(error != nil) {
                strongSelf.lblStatus.text = "Error, check username and password"
                print(error)
                return
            }
            strongSelf.lblStatus.text = "Login sucesss for email \(email)"
        }
    }
    
    @IBAction func createAccount(_ sender: Any) {
        let email = txtEmail.text!
        let password = txtPassword.text!
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if(error != nil) {
                self.lblStatus.text = "Error"
                print(error)
                return
            }
            self.lblStatus.text = "User created!"
        }
    }
    
    
}

