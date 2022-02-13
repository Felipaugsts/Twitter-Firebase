//
//  RegisterViewController.swift
//  Firebase-app
//
//  Created by FELIPE AUGUSTO SILVA on 12/02/22.
//

import UIKit
import FirebaseAuth
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var registerButton: UIButton!
    
    @IBOutlet weak var NameRegister: UITextField!
    
    @IBOutlet weak var EmailRegister: UITextField!
    
    @IBOutlet weak var PasswordRegister: UITextField!
    
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    @IBAction func onRegisterTap(_ sender: Any) {
        let name = NameRegister.text ?? ""
        let email = EmailRegister.text ?? ""
        let password = PasswordRegister.text ?? ""
        
        if name.isEmpty == false && email.isEmpty == false && password.isEmpty == false {
            loader.startAnimating()
            AuthVM.Register(email: email, password: password, name: name, Completion: { (Result) in
                if Result == true {
                    
                    let alert = UIAlertController(title: "Accound created!", message: "\(name), Your accound has been created successfully", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                    self.loader.stopAnimating()
                } else if Result == false {
                    print("error")
                    self.loader.stopAnimating()
            }
        })
            
        } else {
            
            if  email.isEmpty == true {
                Utilities.isError(self.EmailRegister)
            }
            if password.isEmpty == true {
                Utilities.isError(self.PasswordRegister)
            }
            if name.isEmpty == true {
                Utilities.isError(self.NameRegister)
        }
    }
}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.styleFilledButton(registerButton)
    }
}


