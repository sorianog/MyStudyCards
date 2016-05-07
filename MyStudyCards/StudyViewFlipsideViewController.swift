//
//  StudyViewFlipsideViewController.swift
//  MyStudyCards
//
//  Created by Noah Brusky on 4/28/16.
//  Copyright © 2016 MSOE SE-4910i. All rights reserved.
//

import UIKit

class StudyViewFlipsideViewController: UIViewController {
    
    @IBOutlet weak var label: UITextView!
    
    @IBAction func close() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateText()
        
        let value = UIInterfaceOrientation.LandscapeLeft.rawValue
        UIDevice.currentDevice().setValue(value, forKey: "orientation")
        
        // Do any additional setup after loading the view.
    }
    
    func updateText(){
        label.text = backOfCards[currentCard]
    }
    
    override func shouldAutorotate() -> Bool {
        return true
    }
    

}
