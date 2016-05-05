//
//  CreateACardViewController.swift
//  MyStudyCards
//
//  Created by Sean Khodl on 4/28/16.
//  Copyright © 2016 MSOE SE-4910i. All rights reserved.
//

import UIKit

class CreateACardViewController: ViewController {
    
    @IBOutlet weak var cardFrontDescription: UITextField!
    @IBOutlet weak var cardBackDescription: UITextField!
    
    var cardArray = [Card]()

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
    
    @IBAction func saveCardClick(){
        //place into temp array
        let newCard = Card(frontDescription: cardFrontDescription.text!, backDescription: cardBackDescription.text!)
        cardArray.append(newCard)
        
    }

}
