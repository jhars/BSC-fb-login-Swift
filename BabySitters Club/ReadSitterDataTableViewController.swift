//
//  ReadSitterDataTableViewController.swift
//  BabySitters Club
//
//  Created by Jon Harlan on 12/24/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//

import UIKit

//protocol ReadSitterDataTVCDelegate {
//    func returnUserData()
//}
class ReadSitterDataTableViewController: UITableViewController {

    
    
    @IBAction func refreshSitters(sender: AnyObject) {
        var fbUserData = self.returnUserData()
        
    }
    
    
    
//    var delegate:ReadSitterDataTVCDelegate?
    var tableData = [String]()
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    

    //========================================//
    var ref = Firebase(url: "https://sitterbookapi.firebaseio.com/")
    //========================================//
    func returnUserData() {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {   // Process error
                print("Error: \(error)")
            } else {
                
                let userID : NSString = result.valueForKey("id") as! NSString
                print("User ID is is: \(userID)")
            }
        })
    }



    //========================================//
                // View Did Load //
    //========================================//

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //SETUP VALUES FOR CELLS HERE
        
        //Return Data From FireBase API using Facebook
            }
    //========================================//
    //========================================//
    //========================================//
}
