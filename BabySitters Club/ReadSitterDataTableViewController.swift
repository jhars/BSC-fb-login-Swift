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
    
    func getImgFromFireBaseUrl(imgUrlString:String) {
        
    }
    //============= Facebook Data - User ID ================= //
    func findFaceBookId() {
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
                self.getAllImagUrlsFromFireBase(self.tempFireBaseUrlForCurrentUser)
            }
        })
    }
    //============= Facebook Data ================= //
    
    func getAllImagUrlsFromFireBase (firebaseUserId:String){
        var currentUserPath = self.tempFireBaseUrlForCurrentUser

//         + "/sitter-list"
//              var child: FDataSnapshot? = querySnapshot.children.nextObject() as? FDataSnapshot
//                  print("child is ==  \(child?.value)");

        var firebaseRef = Firebase(url:(currentUserPath as String) + "/sitter-list")
        
        firebaseRef.queryOrderedByValue().observeEventType(.ChildAdded, withBlock: { snapshot in
            var sitterObjDict = snapshot.value as! NSDictionary
            self.getJpgImagesFromUrl(sitterObjDict)
            })
    }

    func getJpgImagesFromUrl (objDictionary:NSDictionary) {

                var data = objDictionary.valueForKey("image-url") as! String
        
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

    }
    

    
    

    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    

    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        //            cell.imageView?.image = self.imageArray[indexPath.row]
//        cell.textLabel?.text = contacts[indexPath.row]
        cell.imageView?.image = self.tableData[indexPath.row]
        return cell
    }
    
    
    
    
    
//   INITIALIZER (Action)
    override func viewDidLoad() {
        super.viewDidLoad()
        findFaceBookId()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
