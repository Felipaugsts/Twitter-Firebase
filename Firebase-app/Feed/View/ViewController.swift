//
//  ViewController.swift
//  Firebase-app
//
//  Created by FELIPE AUGUSTO SILVA on 11/02/22.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseFirestoreSwift

class ViewController: UIViewController {

    let database = Firestore.firestore()
    var allTweets: [tweetModel] =  []
    
    @IBOutlet weak var FeedCollectionView: UICollectionView!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        getData()
    }

    
    func getData() {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Read the documents at a specific path
        db.collection("Tweet").addSnapshotListener { (QuerySnapShot, error) in
            guard let documents = QuerySnapShot?.documents else {
                return
            }
            
            self.allTweets = documents.compactMap{(QuerySnapShotDoc) -> tweetModel? in
               return try? QuerySnapShotDoc.data(as: tweetModel.self)
            }
            self.FeedCollectionView.reloadData()
        }
    }
}




extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allTweets.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = FeedCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FeedCollectionViewCell
        
        let tt = self.allTweets[indexPath.row]

        cell.username.text = tt.username
        cell.tweet.text = tt.text
        cell.avatar.image = UIImage(systemName: tt.avatar)
        
        return cell
    }
    
    
    
}

