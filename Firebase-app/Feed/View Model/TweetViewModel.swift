//
//  TweetViewModel.swift
//  Firebase-app
//
//  Created by FELIPE AUGUSTO SILVA on 11/02/22.
//

import Foundation
import Firebase
import FirebaseFirestore

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
}
