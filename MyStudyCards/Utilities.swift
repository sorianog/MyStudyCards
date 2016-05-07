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

func tempFillCards(){
    frontOfCards.append("Card 1")
    frontOfCards.append("Card 2")
    frontOfCards.append("Card 3")
    frontOfCards.append("Card 4")
    frontOfCards.append("Card 5")
    frontOfCards.append("Card 6")
    backOfCards.append("Back of card 1")
    backOfCards.append("Back of card 2")
    backOfCards.append("Back of card 3")
    backOfCards.append("Back of card 4")
    backOfCards.append("Back of card 5")
    backOfCards.append("Back of card 6")
    
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