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
                
                //RUN NEXT FUNCTION
//                self.getAllImagUrlsFromFireBase(self.tempFireBaseUrlForCurrentUser)
                var currentUserPath = self.tempFireBaseUrlForCurrentUser
                
                var firebaseRef = Firebase(url:(currentUserPath as String) + "/sitter-list")
                
                firebaseRef.queryOrderedByValue().observeEventType(.ChildAdded, withBlock: { snapshot in
                    var sitterObjDict = snapshot.value as! NSDictionary
                    
                    
                  //RUN NEXT FUNCTION
//                    self.getJpgImagesFromUrl(sitterObjDict)
                    var data = sitterObjDict.valueForKey("image-url") as! String
                    
                    var AlamofireRef = data
                    
                    Alamofire.request(.GET, data)
                        .responseImage { response in
                            debugPrint(response)
                            
                            print(response.request)
                            print(response.response)
                            debugPrint(response.result)
                            
                            if let image = response.result.value {
                                //                    print("image downloaded: \(image)")
                                
                                //                    self.imgProtoOne.image = image
                                self.tableData.append(image as UIImage)
                            }
                    }
                    print(self.tableData)
                })

            }
        })
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
    
    
    
    
    
//   INITIALIZER (Action)
    override func viewDidLoad() {
        super.viewDidLoad()
        returnUserData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
