//
//  SitterMatchViewController.swift
//  BabySitters Club
//
//  Created by Jon Harlan on 12/29/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//

import UIKit
import Alamofire

        var sitterMatchModel = [String]()

class SitterMatchViewController: UIViewController {

    @IBOutlet weak var activityWheel: UIActivityIndicatorView!

    
    var currentUserId:String = ""
    var tempFireBaseUrlForCurrentUser:String = ""
    var cnxImageUrl:String = ""

    
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        returnUserData()

       

        
        }//=================================================================\\

    func returnUserData() {
//        var tempSitterArr = [String]()
        
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {   // Process error
                print("Error: \(error)")
            } else {
                
                let userID : NSString = result.valueForKey("id") as! NSString
                print("User ID is is: \(userID)")
                self.currentUserId = userID as String
                self.tempFireBaseUrlForCurrentUser = "https://sitterbookapi.firebaseio.com/users/" + (userID as String)
                
                //RUN NEXT FUNCTION
                //                self.getAllImagUrlsFromFireBase(self.tempFireBaseUrlForCurrentUser)
                var currentUserPath = self.tempFireBaseUrlForCurrentUser
                
                var firebaseRef = Firebase(url:(currentUserPath as String) + "/sitter-list/")
                
                firebaseRef.queryOrderedByValue().observeEventType(.ChildAdded, withBlock: { snapshot in
                    var sitterObjDict = snapshot.value as! NSDictionary
                    //                    let tempSitterObj = sitterObjDict.componentsSeparatedByString("name = \"")
                    print(sitterObjDict["name"]!)
                    //                    self.tempSitterArr.append(sitterObjDict["name"] as! String)
                    
                    //                        dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    
                    sitterMatchModel.append(sitterObjDict["name"] as! String)
                    
                    
                    //"self" b/c we're in a closure here > referring to Outlet Above
                    //                        })
                    
                    
                    //= sitterObjDict//["name"]
                    //                    print(self.tempSitterArr)
                    //                    tempSitterObj["name"] = sitterObjDict
                    //                    print(tempSitterObj)
                    
                })
                
                
                
            }
//            print(tempSitterArr)
            self.performSegueWithIdentifier("showSitter", sender: nil)
            
        })
        
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//
//        let destTVC = segue.destinationViewController as!  SitterMatchesTableViewController
//        destTVC.sitterMatchModel =
//    }


}
