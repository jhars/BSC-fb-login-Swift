//  SitterMatchesTableViewController.swift
//  BabySitters Club

import UIKit

class SitterMatchesTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sitterMatchModel.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("sitterCell", forIndexPath: indexPath)
        let name = sitterMatchModel[indexPath.row]
        cell.textLabel!.text = name
        
        return cell
    }

}
