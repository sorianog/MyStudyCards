//
//  ResultsScreenViewController.swift
//  MyStudyCards
//
//  Created by Noah Brusky on 4/28/16.
//  Copyright © 2016 MSOE SE-4910i. All rights reserved.
//

import UIKit

class ResultsScreenViewController: UIViewController {
    
  @IBOutlet weak var correctAmtLabel: UILabel!
  @IBOutlet weak var incorrectAmtLabel: UILabel!
  
  @IBAction func doneClicked() {
        correct = 0
        incorrect = 0
        currentCard = 0
        frontOfCards.removeAll()
        backOfCards.removeAll()

        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("mainViewController") as UIViewController
        self.presentViewController(nextViewController, animated:true, completion:nil)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    correctAmtLabel.text = "\(correct)"
    incorrectAmtLabel.text = "\(incorrect)"
  }
}
