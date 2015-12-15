//
//  BackTableVC.swift
//  BabySitters Club
//
//  Created by Jon Harlan on 12/14/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//

import Foundation




class BackTableVC: UITableViewController {

    var TableArray = [String]()
    
    override func viewDidLoad() {
        TableArray = ["Home","Browse Sitters","Favorites List","Matches + Messaging"]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell
    
        cell.textLabel?.text = TableArray[indexPath.row]
        
        return cell
    }
}