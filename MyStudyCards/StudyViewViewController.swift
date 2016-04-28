//
//  StudyViewViewController.swift
//  MyStudyCards
//
//  Created by Sean Khodl on 4/28/16.
//  Copyright © 2016 MSOE SE-4910i. All rights reserved.
//

import UIKit

class StudyViewViewController: ViewController {

    @IBAction func thumbsUpClicked() {
        //for now, this just advances to the results screen
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        
        let nextViewController = storyBoard.instantiateViewControllerWithIdentifier("resultsViewController") as UIViewController
        self.presentViewController(nextViewController, animated:true, completion:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let value = UIInterfaceOrientation.LandscapeLeft.rawValue
        UIDevice.currentDevice().setValue(value, forKey: "orientation")
        
        // Do any additional setup after loading the view.
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
