//
//  TweetViewController.swift
//  Firebase-app
//
//  Created by FELIPE AUGUSTO SILVA on 13/02/22.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class TweetViewController: UIViewController {
    
    var displayName: String = ""
    var uid: String = ""


    @IBOutlet weak var TweetField: UITextView!
    
    
    @IBAction func onTapSave(_ sender: Any) {
        let database = Firestore.firestore()
        tweetViewModel.addNewTweet(uid: uid, username: displayName, avatar: "person", text: TweetField.text, Completion: {(Result) in
            self.dismiss(animated: true, completion: nil)
        })
 

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
      Auth.auth().addStateDidChangeListener { (auth, user) in

            if let user = user {
                let name = user.displayName ?? ""
                let uid = user.uid ?? ""
                self.displayName = name
                self.uid = uid
                

    
            } else {
                // No user
                print("user not logged ")
            }
        
    }
    }

}
