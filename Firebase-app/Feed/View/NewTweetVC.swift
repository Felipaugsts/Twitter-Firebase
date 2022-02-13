//
//  NewTweetVC.swift
//  Firebase-app
//
//  Created by FELIPE AUGUSTO SILVA on 11/02/22.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class NewTweetVC: UINavigationController {
    let database = Firestore.firestore()
    
    @IBOutlet weak var textView: UITextView!
    
    @IBAction func didTapSave(_ sender: Any) {
        
        let id = database.collection("Tweet").document()
        print("id", id.documentID)
        id.setData([
                        "id": id.documentID,
                        "text": textView.text,
                        "username": "Felipe Augusto",
                        "avatar": "person"
        ])
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
