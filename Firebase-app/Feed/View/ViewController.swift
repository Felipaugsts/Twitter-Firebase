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
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "arrow.uturn.backward.circle.badge.ellipsis"),
            style: .done,
            target: self,
            action: #selector(didtapMenuButton))
        
    }
    override func viewWillAppear(_ animated: Bool) {
        tweetViewModel.isUserLogged(completion: {Result in
            if Result != nil {
                self.getData()
            } else {
                self.didtapMenuButton()
            }
        })
        
    }
    
    @objc private func didtapMenuButton() {
        tweetViewModel.Logout(com: {(Result) in
            print("signout")
            let homeViewController = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as? LoginViewController
        
            self.navigationController?.pushViewController(homeViewController!, animated: true)
        })
    }

    
    func getData() {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Read the documents at a specific path
        db.collection("Tweets").addSnapshotListener { (QuerySnapShot, error) in
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

