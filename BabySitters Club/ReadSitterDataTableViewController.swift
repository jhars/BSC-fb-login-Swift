//
//  ReadSitterDataTableViewController.swift
//  BabySitters Club
//
//  Created by Jon Harlan on 12/24/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//
import Alamofire
import AlamofireImage
import UIKit

//protocol ReadSitterDataTVCDelegate {
//    func returnUserData()
//}
class ReadSitterDataTableViewController: UITableViewController {

//    var urlBaseRef = "h ttps://sitterbookapi.firebaseio.com/users/10205360690837256/fbfriends/first-degree/"
    

//    let testRef02 = Firebase(url:urlBaseRef + "23")
//    let testRef03 = Firebase(url:urlBaseRef + "27")
//    let testRef04 = Firebase(url:urlBaseRef + "33")
//    let testRef05 = Firebase(url:urlBaseRef + "34")
//    let testRef06 = Firebase(url:urlBaseRef + "35")
//    let testRef07 = Firebase(url:urlBaseRef + "39")
//    let testRef08 = Firebase(url:urlBaseRef + "40")
    
    
    

    
    //---------------------- //
    // URL -> IMAGE:LOADER  //
    @IBOutlet weak var testImage: UIImageView!
    //----------------------//
//    var imageUrl:String
//Need to get the URL as variable
    var AlamoRef = Alamofire.request(.GET, "https://scontent.xx.fbcdn.net/hprofile-xft1/v/t1.0-1/p50x50/11407034_10101087548346204_123630956942363426_n.jpg?oh=ad875d6df62556e88ae38d02887d403c&oe=5700342F")
    
//    var sitterArrayUrl:Array = [String]()

    //   INITIALIZER (Action)
    @IBAction func refreshSitters(sender: AnyObject) {

        //=================== DELEGATABLE ========================//
        AlamoRef.responseImage { response in
            debugPrint(response)
//            print(response.request)
//            print(response.response)
            debugPrint(response.result)
            
            if let image = response.result.value {
//                print("image downloaded: \(image)")
                self.testImage.image = image
                print("image loaded!")
            }
        }
        //=================== DELEGATABLE ========================//
            print("image Urls???")
            getSitterData("https://sitterbookapi.firebaseio.com/users/10205360690837256/fbfriends/first-degree/0")
            getSitterData("https://sitterbookapi.firebaseio.com/users/10205360690837256/fbfriends/first-degree/1")
            getSitterData("https://sitterbookapi.firebaseio.com/users/10205360690837256/fbfriends/first-degree/2")
        
    }
    

    
    func getSitterData(imgUrlString:String) {
        
        let testRef = Firebase(url:imgUrlString)
        
        testRef.observeEventType(.Value, withBlock: { snapshot in
//            print(snapshot.value)
            var userData = snapshot.value.objectForKey("picture")?.objectForKey("data")?.objectForKey("url")
            print(userData)
            
            }, withCancelBlock: { error in
                print(error.description)
        })
    }
    
    
//    this could be my Array of Initial URL Strings
    var tableData = [String]()
    
    //============= Facebook Data - User ID ================= //
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
    //============= Facebook Data ================= //
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    
    //========================================//
//    var ref = Firebase(url: "h ttps://sitterbookapi.firebaseio.com/")
    //========================================//
    //  1. Query FireBase using UserID for Image Urls
    //  2. Load Image Urls into Array
    //  3. For Each ImageUrl - LoadImages
    
    //Also Need Access to Photos on Device (iPhone)

//   INITIALIZER (Action)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var fbUserData = self.returnUserData()


    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
