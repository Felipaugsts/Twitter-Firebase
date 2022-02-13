//
//  TweetViewModel.swift
//  Firebase-app
//
//  Created by FELIPE AUGUSTO SILVA on 11/02/22.
//

import Foundation
import Firebase
import FirebaseFirestore
import FirebaseAuth

class tweetViewModel {
    
    static func addNewTweet(uid: String, username: String, avatar: String, text: String, Completion: @escaping (Bool) -> ()) {
        let database = Firestore.firestore()
       let id = database.collection("Tweets").document()
        id.setData([
                        "id": id.documentID,
                        "userId": uid,
                        "text": text,
                        "username": username,
                        "avatar": "person"
        ])
        Completion(true)
    }
    
    static func Logout(com: @escaping (Bool) -> ()) {
                    let firebaseAuth = Auth.auth()
                do {
                  try firebaseAuth.signOut()
                    com(true)
                } catch let signOutError as NSError {
                  print("Error signing out: %@", signOutError)
                }
    }
    
    static func isUserLogged(completion: @escaping (AnyObject) ->()) {
        Auth.auth().addStateDidChangeListener { (auth, user) in

              if let user = user {
                  completion(user)
              } else {
                return
              }
          
      }
    }
}
