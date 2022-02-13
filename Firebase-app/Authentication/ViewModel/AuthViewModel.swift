//
//  AuthViewModel.swift
//  Firebase-app
//
//  Created by FELIPE AUGUSTO SILVA on 13/02/22.
//

import Foundation
import FirebaseAuth

class AuthVM {
    
    static func Login(email: String, password: String, completion: @escaping (Bool) -> ()) {
        Auth.auth().signIn(withEmail: email, password: password) { AuthDataResult, Error in
            if Error == nil {
                completion(true)
            }
            else {
                completion(false)
            }
        }
    }
    
    static func Register(email: String, password: String, name: String, Completion: @escaping (Bool) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { AuthDataResult, Error in
            if let user = AuthDataResult?.user {
                
                let changeRequest = user.createProfileChangeRequest()
                changeRequest.displayName = name
                changeRequest.commitChanges { error in
                    if error == nil {
                        print("success")
                    } else {
                        print("error", error)
                    }
                }
            Completion(true)
                
            } else {
            Completion(false)
            }
        }
    }

}


