//
//  Utilities.swift
//  MyStudyCards
//
//  Created by Sean Khodl on 4/28/16.
//  Copyright © 2016 MSOE SE-4910i. All rights reserved.
//

import Foundation
import CoreData
import UIKit

var decks = [NSManagedObject]()
var cards = [NSManagedObject]()
var frontOfCards = [String]()
var backOfCards = [String]()
var selectedDeckName = "none"
var side = "front"
var shuffle = true

func tempFillCards(){
    if(shuffle){
        cards.shuffleInPlace()
    } else {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        
        let fetchRequest = NSFetchRequest(entityName: "Card")
        
        do {
            let results = try managedContext.executeFetchRequest(fetchRequest)
            cards = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }

    }
    for index in 0...cards.count-1 {
        let card = cards[index]
        if(card.valueForKey("dName") as! String == (selectedDeckName)){
            if(side == "front"){
                frontOfCards.append(card.valueForKey("front") as! String)
                backOfCards.append(card.valueForKey("back") as! String)
            } else {
                frontOfCards.append(card.valueForKey("back") as! String)
                backOfCards.append(card.valueForKey("front") as! String)
            }
        }
    }
    
}

struct Card{
    var frontDescription: String
    var backDescription: String
    var dname: String
}

extension CollectionType {
    /// Return a copy of `self` with its elements shuffled
    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}

extension UIViewController {
  func hideKeyboardWhenTappedAround() {
    let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
    view.addGestureRecognizer(tap)
  }
  
  func dismissKeyboard() {
    view.endEditing(true)
  }
}