//  SitterMatchViewController.swift
//  BabySitters Club

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
        }
//=================================================================\\
    func returnUserData() {
        
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

                let currentUserPath = self.tempFireBaseUrlForCurrentUser
                let firebaseRef = Firebase(url:(currentUserPath as String) + "/sitter-list/")
                
                firebaseRef.queryOrderedByValue().observeEventType(.ChildAdded, withBlock: { snapshot in
                    let sitterObjDict = snapshot.value as! NSDictionary
                    print(sitterObjDict["name"]!)
                    sitterMatchModel.append(sitterObjDict["name"] as! String)
                })
            }
            self.performSegueWithIdentifier("showSitter", sender: nil)
        })
    }
}
