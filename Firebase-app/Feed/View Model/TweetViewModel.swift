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
    
    let database = Firestore.firestore()
    
    public func addNewTweet(_ tweet: String) {
        let docRef = database.document("Tweets")
        docRef.setData(["text": tweet])
    }
}
