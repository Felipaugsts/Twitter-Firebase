//
//  TweetModel.swift
//  Firebase-app
//
//  Created by FELIPE AUGUSTO SILVA on 11/02/22.
//

import Foundation
import FirebaseFirestoreSwift

struct tweetModel: Codable {
var text: String
var username: String
var avatar: String
var id: String
//    @DocumentId var id: String? = UUID().uuidString
}
