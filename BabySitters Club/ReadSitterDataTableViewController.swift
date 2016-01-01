//
//  ReadSitterDataTableViewController.swift
//  BabySitters Club
//
//  1. Query FireBase using UserID for Image Urls
//  2. Load Image Urls into Array
//  3. For Each ImageUrl - LoadImages



import Alamofire
import AlamofireImage
import UIKit

class ReadSitterDataTableViewController: UITableViewController {
    
    var currentUserId:String = ""
    var tempFireBaseUrlForCurrentUser:String = ""
    var cnxImageUrl:String = ""
    var tableData = [UIImage]()
    

    
    //---------------------- /
    // URL -> IMAGE:LOADER  //
    //----------------------//
    //   INITIALIZER (Action)
    @IBAction func refreshSitters(sender: AnyObject) {
        print("refresh")
    }
    
    
    
    //============================= Refer to GoogleNews API-Reader from course for segue and Model Structurd
    
    //   INITIALIZER (Action)
    override func viewDidLoad() {
        super.viewDidLoad()
//        returnUserData()
//        print(self.tempSitterArr)
    }



    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        cell.imageView?.image = self.tableData[indexPath.row]
        return cell
    }
// ======== V did LOAD =============== //
}
