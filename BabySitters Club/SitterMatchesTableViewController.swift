//
//  SitterMatchesTableViewController.swift
//  BabySitters Club
//
//  Created by Jon Harlan on 12/29/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//

import UIKit

class SitterMatchesTableViewController: UITableViewController {
    
//    var sitterMatchModel = [SitterMatchModel]()
    


//    var posts: [String: String] = [String: String]()
    var currentUserId:String = ""
    var tempFireBaseUrlForCurrentUser:String = ""
    var cnxImageUrl:String = ""
    var tableData = [UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(sitterMatchModel.count)
        return sitterMatchModel.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("sitterCell", forIndexPath: indexPath)
        
        //        let sitterModel = sitterMatchModel[indexPath.row]
        //        print(sitterMatchModel)
//        var keys: Array = Array(self.sitterMatchModel)
        let name = sitterMatchModel[indexPath.row]
        //see Keys for working with Dictionaries
        print(name)
        cell.textLabel!.text = name
        //        cell.detailTextLabel?.text = sitterModel.imgUrl
//        print(sitterMatchModel)
        
        //can also be aware of score here
        //        cell.imageView?.image = // Alamofire Image Loader ( sitterModel.imgUrl )
        
        return cell
    }



}
