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
  @IBOutlet weak var tableView: UITableView!
    
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.hideKeyboardWhenTappedAround()
    print("View Did Load")
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
        card.setValue(cards.count, forKey:  "cardNumber")
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
    
    //UPDATE HERE
    tableView.reloadData()
    
  }
    
    func loadCardsOnReturn(){
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
}

extension CreateADeckViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("table view number of Rows IN Section")
        return cards.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var deckCardList = [String]()
        
        var index: Int
        index = 0
        while(index<cards.count-1){
            let card = cards[index]
            print("if and index is: ")
            print(index)
            print(card.valueForKey("front"))
            if card.valueForKey("front") as? String == deckNameField.text!{
                //var cardString = String(card.valueForKey("cardNumber") as? Int)
                print("added to deckCardList")
                deckCardList.append((card.valueForKey("front") as? String)!)
            }
            index++
        }
        
        let cellIdentifier = "cardCell"
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
        }

        let card = deckCardList[indexPath.row]
        cell.textLabel!.text = card
        
        return cell
        
    }
}

extension CreateADeckViewController: UITableViewDelegate {
    
}
