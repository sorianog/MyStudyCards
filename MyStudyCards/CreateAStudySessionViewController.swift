//
//  CreateAStudySessionViewController.swift
//  MyStudyCards
//
//  Created by Sean Khodl on 4/28/16.
//  Copyright © 2016 MSOE SE-4910i. All rights reserved.
//

import UIKit

var deck = Decks();

class CreateAStudySessionViewController: ViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension CreateAStudySessionViewController: UITableViewDataSource{
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return deck.getDecks().count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "DeckCell";
        var cell: UITableViewCell! = tableView.dequeueReusableCellWithIdentifier(cellIdentifier);
        if cell == nil{
            cell = UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
        }
        cell.textLabel!.text = deck.getDecks()[indexPath.row];
        return cell;
    }
    
}

extension CreateAStudySessionViewController: UITableViewDelegate{

    
}
