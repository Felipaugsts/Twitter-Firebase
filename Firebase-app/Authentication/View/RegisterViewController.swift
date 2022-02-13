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
    
    
    @IBAction func onRegisterTap(_ sender: Any) {
        let name = NameRegister.text ?? ""
        let email = EmailRegister.text ?? ""
        let password = PasswordRegister.text ?? ""
        
        if name.isEmpty == false && email.isEmpty == false && password.isEmpty == false {
            Auth.auth().createUser(withEmail: email, password: password) { AuthDataResult, Error in
                if let user = AuthDataResult?.user {
                    
                    let sharedInstance = FirebaseSingleton.sharedInstance
                                        sharedInstance.currentUser = user
                                        sharedInstance.currentUserID = user.uid
                                        sharedInstance.currentUserEmail = user.email // at this point is it possible for this to be nil?
                                        sharedInstance.currentUserDisplayName = name
                    
                    
                    let alert = UIAlertController(title: "Accound created!", message: "\(name), Your accound has been created successfully", preferredStyle: UIAlertController.Style.alert)

                    // add an action (button)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

                    // show the alert
                    self.present(alert, animated: true, completion: nil)
                    
                    
                    
                          } else {
                              print("error")
                          }
                      }
            }
        }
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        layoutConfig()
    }

    func layoutConfig() {
        Utilities.styleFilledButton(registerButton)
    }
}



class FirebaseSingleton{

    static let sharedInstance = FirebaseSingleton()


    var currentUser: User? = Auth.auth().currentUser
    var currentUserID: String? = Auth.auth().currentUser?.uid
    var currentUserEmail: String? = Auth.auth().currentUser?.email
    var currentUserDisplayName: String? = Auth.auth().currentUser?.displayName
    
    
}
