//
//  Utilities.swift
//  Firebase-app
//
//  Created by FELIPE AUGUSTO SILVA on 11/02/22.
//

import Foundation
import UIKit

class Utilities {
    
    static func TweetTextView(_ text:UITextView) {
        text.layer.borderWidth = 0.3
        text.layer.borderColor = UIColor.gray.cgColor
        
    }
    
    static func TweetCell(_ cell: UICollectionViewCell) {
    
        cell.layer.borderWidth = 1.3
        cell.layer.borderColor = UIColor.gray.cgColor
}
    
    static func styleFilledButton(_ button:UIButton) {
        
        // Filled rounded corner style
        button.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        button.layer.cornerRadius = 20.0
        button.tintColor = UIColor.white
    }
    
    static func styleHollowButton(_ button:UIButton) {
        
        // Hollow rounded corner style
        button.layer.borderWidth = 1.3
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.cornerRadius = 20.0
        button.tintColor = UIColor.black
    }
    
    static func isError(_ errorTxt: UITextField) {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "shadowColor")
        let revert = true
        let baseColor = UIColor.gray.cgColor
        animation.fromValue = baseColor
        animation.toValue = UIColor.red.cgColor
        animation.duration = 0.4
        if revert { animation.autoreverses = true } else { animation.autoreverses = false }
        errorTxt.layer.add(animation, forKey: "")

        let shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 0.07
        shake.repeatCount = 3
        if revert { shake.autoreverses = true  } else { shake.autoreverses = false }
        shake.fromValue = NSValue(cgPoint: CGPoint(x: errorTxt.center.x - 5, y: errorTxt.center.y))
        shake.toValue = NSValue(cgPoint: CGPoint(x: errorTxt.center.x + 5, y: errorTxt.center.y))
        errorTxt.layer.add(shake, forKey: "position")
        errorTxt.textColor = .red
        errorTxt.layer.borderWidth = 1
        errorTxt.layer.cornerRadius = 10
        errorTxt.layer.borderColor = UIColor(red: 1, green: 0, blue: 0.0157, alpha: 1.0).cgColor
    }
    
}
