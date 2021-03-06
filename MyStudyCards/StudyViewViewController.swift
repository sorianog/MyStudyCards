//
//  StudyViewViewController.swift
//  MyStudyCards
//
//  Created by Sean Khodl on 4/28/16.
//  Copyright © 2016 MSOE SE-4910i. All rights reserved.
//

import UIKit

var correct = 0
var incorrect = 0
var currentCard = 0

class StudyViewViewController: ViewController {

    @IBOutlet weak var label: UITextView!

  @IBAction func thumbsUpClicked() {
    correct = correct + 1
    currentCard = currentCard + 1
    if(currentCard >= frontOfCards.count){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("resultsViewController") as UIViewController
        self.presentViewController(nextViewController, animated:true, completion:nil)
    } else {
        updateText()
    }
  
  }
  
  
  @IBAction func thumbsDownClicked() {
    incorrect = incorrect + 1
    currentCard = currentCard + 1
    if(currentCard >= frontOfCards.count){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("resultsViewController") as UIViewController
        self.presentViewController(nextViewController, animated:true, completion:nil)
    } else {
        updateText()
    }
  }
  
  override func viewDidLoad() {
      super.viewDidLoad()
      updateText()
    
      let value = UIInterfaceOrientation.LandscapeLeft.rawValue
      UIDevice.currentDevice().setValue(value, forKey: "orientation")
      
      // Do any additional setup after loading the view.
  }
    
    func updateText(){
        label.text = frontOfCards[currentCard]
    }

  override func didReceiveMemoryWarning() {
      super.didReceiveMemoryWarning()
      // Dispose of any resources that can be recreated.
  }
  
  override func shouldAutorotate() -> Bool {
      return true
  }
  

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
      // Get the new view controller using segue.destinationViewController.
      // Pass the selected object to the new view controller.
  }
  */

}
