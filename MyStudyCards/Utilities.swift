//
//  Utilities.swift
//  MyStudyCards
//
//  Created by Sean Khodl on 4/28/16.
//  Copyright © 2016 MSOE SE-4910i. All rights reserved.
//

import Foundation
import CoreData

var decks = [NSManagedObject]()
var cards = [NSManagedObject]()

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
