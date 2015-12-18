//
//  fbLoginViewController.swift
//  BabySitters Club
//
//  Created by Jon Harlan on 12/17/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//

import UIKit

class fbLoginViewController: UIViewController {

    
    
    @IBAction func userFbData(sender: UIButton) {
        print("data here")
        self.returnUserData()
        //POST Data to Internal API after this
        // => ID + Name (from fb) -- new User
        // => package w/ Zip-Code (from user-input)
        // (initial) UserObj == [{}]
//        var UserObject = [
//            {"name" : "Jon Harlan" },
//            {"id" : "10205360690837256"},
//            {"zip" : "94117"}
//            ]
        // => hit URL... sitterbook.com/user/:id
        // => Simoultaneously send Data to Server
        
        // ON SERVER
        // Server Imports User-Social-Context (friends)
        // Imports Internal API info (id, name, zip)
        //     Packages:
        // client-object (id, zip)
        //       WITH
        // server-object (friends)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me/friends", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")
                
//                let userName : NSString = result.valueForKey("name") as! NSString
//                print("User Name is: \(userName)")
//                
//                let userID : NSString = result.valueForKey("id") as! NSString
//                print("User ID is is: \(userID)")
                
//                let userFriends : NSString = result.valueForKey("user_friends") as! NSString
//                print("User ID is is: \(userFriends)")
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
