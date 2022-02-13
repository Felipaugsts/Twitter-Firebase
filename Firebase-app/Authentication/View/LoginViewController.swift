//
//  LoginViewController.swift
//  Firebase-app
//
//  Created by FELIPE AUGUSTO SILVA on 12/02/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    @IBAction func onLoginTap(_ sender: Any) {
        
        let email = emailField.text ?? ""
        let password = passwordField.text ?? ""

        if email.isEmpty == false && password.isEmpty == false {
            print(email, password)
            loader.startAnimating()
            AuthVM.Login(email: email, password: password, completion: {(Result) in
                print(Result)
                if Result == true {
                    print("passou")
                } else if Result == false {
                    self.setError()
                }
            })
          
        } else {
            self.setError()
        }
    }
    
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayoutConfig()
    }
    
    func setLayoutConfig() {
        Utilities.styleFilledButton(loginButton)
        Utilities.styleHollowButton(registerButton)
    }
    
    func setError() {
        Utilities.isError(self.emailField)
        Utilities.isError(self.passwordField)
    }
}

