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
                print("did pass", AuthDataResult ?? "")

                completion(true)

            }
            else {
                completion(false)
            }
    }
}
}
