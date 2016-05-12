//
//  CreateAStudySessionViewController.swift
//  MyStudyCards
//
//  Created by Sean Khodl on 4/28/16.
//  Copyright © 2016 MSOE SE-4910i. All rights reserved.
//

import UIKit
import CoreData

class CreateAStudySessionViewController: ViewController{

    @IBOutlet weak var sideSwitch: UISwitch!
    @IBOutlet weak var shuffleSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDecks()
        loadCards()
//        sideSwitch.addTarget(self, action: #selector(CreateAStudySessionViewController.sideSwitchIsChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
//        shuffleSwitch.addTarget(self, action: #selector(CreateAStudySessionViewController.shuffleSwitchIsChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    @IBAction func startSessionClicked(){
        frontOfCards.removeAll()
        backOfCards.removeAll()
        tempFillCards()
        NSNotificationCenter.defaultCenter().postNotificationName("updateCards", object: nil, userInfo: nil)
    }
  
  func loadDecks() {
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let managedContext = appDelegate.managedObjectContext
    
    let fetchRequest = NSFetchRequest(entityName: "Deck")
    
    do {
      let results = try managedContext.executeFetchRequest(fetchRequest)
      decks = results as! [NSManagedObject]
    } catch let error as NSError {
      print("Could not save \(error), \(error.userInfo)")
    }
  }
    
    func loadCards() {
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
    
    func sideSwitchIsChanged(sideSwitch: UISwitch) {
        if (sideSwitch.on) {
            side = "front"
        } else {
            side = "back"
        }
    }
    
    func shuffleSwitchIsChanged(sideSwitch: UISwitch) {
        if (sideSwitch.on) {
            shuffle = true;
        } else {
            shuffle = false;
        }
    }
  

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension CreateAStudySessionViewController: UITableViewDataSource {
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return decks.count
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cellIdentifier = "CurrDecksCell"
    var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
    if cell == nil {
      cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
    }
    let deck = decks[indexPath.row]
    cell.textLabel!.text = deck.valueForKey("name") as? String
    return cell
  }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let indexPath = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRowAtIndexPath(indexPath!)! as UITableViewCell
        selectedDeckName = (currentCell.textLabel!.text)!
    }

    
    
}

extension CreateAStudySessionViewController: UITableViewDelegate {
  
}
