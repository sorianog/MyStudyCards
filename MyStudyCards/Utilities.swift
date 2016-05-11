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

func tempFillCards(){
    //loop over cards, finding each card where dname=selectedDeckName
    //append the back and front values to the approriate front/back arrays
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

class Decks{
    
    init(){
        addDummyData()
    }
    var decksList = [String]()
    //return list of current decks
    func getDecks() -> [String]{
        
        return decksList
    }
    
    //add provided string to list of decks
    func addToDeck(name: String){
        
        decksList.append(name)
    }
    
    func addDummyData(){
        decksList.append("Gerald")
        decksList.append("Sean")
        decksList.append("Noah")
    }
    
}

class Cards{
    
    var cardsList = [String]()
    
    func getCards() -> [String]{
        return cardsList
    }
    
    func addToCards(name: String){
        cardsList.append(name)
    }
}


struct Card{
    var frontDescription: String
    var backDescription: String
    var dname: String
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