//
//  Utilities.swift
//  MyStudyCards
//
//  Created by Sean Khodl on 4/28/16.
//  Copyright © 2016 MSOE SE-4910i. All rights reserved.
//

import Foundation

class Decks{
    
    var decksList = [String]()
    
    //return list of current decks
    func getDecks() -> [String]{
        decksList.append("Gerald");
        decksList.append("Sean");
        decksList.append("Noah");
        return decksList;
    }
    
    //add provided string to list of decks
    func addToDeck(name: String){
        
        decksList.append(name);
    }
    
}

class Cards{
    
    var cardsList = [String]()
    
    func getCards() -> [String]{
        return cardsList;
    }
    
    func addToCards(name: String){
        cardsList.append(name);
    }
}
