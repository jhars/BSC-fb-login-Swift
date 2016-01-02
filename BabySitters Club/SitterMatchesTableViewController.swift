//  SitterMatchesTableViewController.swift
//  BabySitters Club

import UIKit
import Alamofire
import AlamofireImage

//var imageArray = [UIImage]()

class SitterMatchesTableViewController: UITableViewController {
    
    var models = [SitterMatchModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        print("image ARRAY below::--->>>>")
        print(sitterModelObjects.count)
        print("image ARRAY is Above ^^^^^^^")
}
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sitterModelObjects.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("sitterCell", forIndexPath: indexPath)
        
//        let model = models[indexPath.row]
        let model = sitterModelObjects[indexPath.row]
        
        cell.textLabel?.text = model.name
        cell.detailTextLabel?.text = "Cnx Strength: " + String(model.cnxScore!)
        cell.imageView?.image = model.img

        return cell
    }

}
