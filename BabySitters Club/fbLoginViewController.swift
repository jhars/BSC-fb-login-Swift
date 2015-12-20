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
        var userFbookData = self.returnUserData()
        print(userFbookData)
        print("data here 02")
    }
//#1
        
// =========== Client User Object ============ //
//USER OBJECT:
// => ID + Name (from fb) -- new User
// => package w/ Zip-Code (from user-input)
// (initial) var UserObj == [
//            {"name" : "Jon Harlan" },
//            {"id" : "10205360690837256"},
//            {"zip" : "94117"}
//            ] (possibly a sitBookID too..)
// =========== Client User Object ============ //
        
        
        
//#2
//Feed Data to NodeJS server from this Client (this Device)
        
// =========== NODE SERVER: ================ //
//REQUEST: User-Social-Context (Fs, FoFs, 3dF)
//RESPONSE: User-Social-Context (Fs, FoFs, 3dF)
// =========== NODE SERVER: ================ //

//POST Data to Internal API after this
// How do we Bridge this Gap?
        // Internal API?
        // Amazon S3?
        // Ruby?
        
        // ... Google It.
        
//#3
        // => hit URL... sitterbook.com/user/:id
        // => Simoultaneously send Data to:
        //      a- Feed fb-ID through NodeJS Server (Request)
        //      b- GET User-Social-Context (Fs, FoFs, 3dF)

        
        // ON SERVER
        // Server Imports
        // Imports Internal API info (id, name, zip)

// __________________________________________________ //
        
        // ==== PACAKAGE ===== //
        // client-object (id, zip)
        //       WITH
        // server-object (friends)
        //- - - - - - - - - - - //
        // =================== //
        //var userOBJ === [name, fbID, zip]
        // = [NAME, ID, ZIP] = //

    // ______________________VIEW DID LOAD_______________________________________ //
    // __________________________________________________________________________ //
    // __________________________________________________________________________ //
    // __________________________________________________________________________ //
    // __________________________________________________________________________ //
    
    var ref = Firebase(url: "https://sitterbookapi.firebaseio.com/")
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fbloginVC01")
                print("fetched user: \(result)")
                print("fbloginVC02")

                let userID : NSString = result.valueForKey("id") as! NSString
                print("User ID is is: \(userID)")
                
                var newData = userID
                var postRef = self.ref.childByAppendingPath("Posts")
                var newDataValue = newData as String!
                var newPostRef = postRef.childByAutoId()
                newPostRef.setValue(newDataValue)
                
                let userName : NSString = result.valueForKey("name") as! NSString
                print("User Name is: \(userName)")
//

                
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
