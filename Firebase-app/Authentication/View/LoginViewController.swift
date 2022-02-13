//
//  LoginViewController.swift
//  Firebase-app
//
//  Created by FELIPE AUGUSTO SILVA on 12/02/22.
//

import UIKit
import FirebaseAuth

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func onLoginTap(_ sender: Any) {
        
        let email = emailField.text ?? ""
        let password = passwordField.text ?? ""

//        MARK: Validate if fields aren't empty
        
        if email.isEmpty == false && password.isEmpty == false {
            loader.startAnimating()
            
//        MARK: Making post request and handling response
            
            AuthVM.Login(email: email, password: password, completion: {(Result) in
                print(Result)
                if Result == true {
                    
                    let homeViewController = self.storyboard?.instantiateViewController(identifier: Constants.Storyboard.ViewController) as? ViewController
                
                    self.navigationController?.pushViewController(homeViewController!, animated: true)
                    
                } else if Result == false {
                    self.setError()
                }
            })
          
        } else {
            self.setError()
        }
    }
    
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
      
