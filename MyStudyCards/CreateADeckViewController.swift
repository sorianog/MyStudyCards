//
//  CreateADeckViewController.swift
//  MyStudyCards
//
//  Created by Sean Khodl on 4/28/16.
//  Copyright © 2016 MSOE SE-4910i. All rights reserved.
//

import UIKit
import CoreData

class CreateADeckViewController: ViewController {

  @IBOutlet weak var deckNameField: UITextField!
    
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
  
  @IBAction func saveClicked() {
    saveDeckName(deckNameField.text!)
  }
    

    @IBAction func createCard(){
        curDeckName = deckNameField.text!
    }
  
  func saveDeckName(name: String){
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let managedContext = appDelegate.managedObjectContext
    
    let entity = NSEntityDescription.entityForName("Deck", inManagedObjectContext: managedContext)
    
    let deck = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
    
    deck.setValue(name, forKey: "name")
    
    
    do {
      try managedContext.save()
      decks.append(deck)
    } catch let error as NSError {
      print("Could not save \(error), \(error.userInfo)")
    }
    
    for toAdd in curCardArray{
        let curEntity = NSEntityDescription.entityForName("Card", inManagedObjectContext: managedContext)
        let card = NSManagedObject(entity: curEntity!, insertIntoManagedObjectContext: managedContext)
        card.setValue(toAdd.dname, forKey: "dName")
        card.setValue(toAdd.frontDescription, forKey: "front")
        card.setValue(toAdd.backDescription, forKey: "back")
        do {
            try managedContext.save()
            print("saved card to cards")
            print(cards.count)
            cards.append(card)
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
    }
    //remove all after saving
    curCardArray.removeAll()
    
  }

}
