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

class ReadSitterDataTableViewController: UITableViewController {

    var currentUserId:String = ""
    
    var tempFireBaseUrlForCurrentUser:String = ""
    
    var cnxImageUrl:String = ""
    
    var tableData = [String]()
    
    
    
    //---------------------- //
    // URL -> IMAGE:LOADER  //
    @IBOutlet weak var testImage: UIImageView!
    //----------------------//


    //   INITIALIZER (Action)
    @IBAction func refreshSitters(sender: AnyObject) {
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
        
        var firebaseRef = Firebase(url:(currentUserPath as String))
        
//        print (firebaseRef)
        var queryRef = firebaseRef.queryOrderedByValue()
        
        queryRef.observeEventType(.ChildAdded, withBlock: { querySnapshot in
                print(querySnapshot.value)
            
            var child: FDataSnapshot? = querySnapshot.children.nextObject() as? FDataSnapshot
            
            print("child is ==  \(child?.key)");
//                queryRef.observeEventType(.ChildAdded, withBlock: { snapshot in
//            
//                )}
            })
        
            
//            .observeEventType(.Value, withBlock: { stegosaurusHeightSnapshot in
//                if let favoriteDinoHeight = stegosaurusHeightSnapshot.value as? Double {
//                    let queryRef = ref.queryOrderedByChild("height").queryEndingAtValue(favoriteDinoHeight).queryLimitedToLast(2)
//                        queryRef.observeSingleEventOfType(.Value, withBlock: { querySnapshot in
//                            }, withCancelBlock: { error in
//                                print(error.description)

        
//        firebaseRef.observeEventType(.Value, withBlock: { snapshot in
//            var userData = snapshot.value.objectForKey("sitter-list")
//            print(userData)
//            }, withCancelBlock: { error in
//                print(error.description)
//        })
        //  1. Query FireBase using UserID for Image Urls
        //  2. Load Image Urls into Array
        //  3. For Each ImageUrl - LoadImages
        
        
            var tempUrlForJpg = "https://scontent.xx.fbcdn.net/hprofile-xpt1/v/t1.0-1/p50x50/12190919_10102581058954074_1908735207991004359_n.jpg?oh=2e458b46499f38c47d50a324a30c0ad8&oe=5716104D"
        
            self.getJpgImagesFromUrl(tempUrlForJpg)
    }
//   var AlamoRef = Alamofire.request(.GET, "\(tempFireBaseUrlForCurrentUser as String)")
    func getJpgImagesFromUrl (imgPageUrl:String) {
//        var AlamoRef = Alamofire.request(.GET, "\(imgPageUrl as String)")
//       
//        AlamoRef.responseImage { (Response, NSError>) -> Void in
//            
//                AlamoRef.responseImage { response in
//                debugPrint(response)
//                print(response.request)
//                print(response.response)
//                debugPrint(response.result)
//                  
                print("finished thread on -> getJpgImageFromUrl {func} ")
//            
//                if let image = response.result.value {
//            
//                self.testImage.image = image
//                print("image loaded!")
//                }
//                }
//                print("image Urls???")
//        }
    }
    
    

//    
//    if let image = response.result.value {
//    
//    self.testImage.image = image
//    print("image loaded!")
//    }
//    }
//    print("image Urls???")

    
    
    
    
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    
    //= = = =  = = =  = = =  = = = = =  = = = = =//
    
    

//   INITIALIZER (Action)
    override func viewDidLoad() {
        super.viewDidLoad()
//        var fbUserData = self.returnUserData()
        findFaceBookId()
        

        
//        var testRef = Firebase(url:cnxImageUrl)
//        testRef.observeEventType(.Value, withBlock: { snapshot in
//            var userData = snapshot.value
//            print(userData)
//            //            var userData = snapshot.value.objectForKey("picture")?.objectForKey("data")?.objectForKey("url")
//            }, withCancelBlock: { error in
//                print(error.description)
//        })
        
        
//        var imgToLoad = getImgUrlFromFireBase(cnxImageUrl)
//        var FirebaseRef = Firebase(url: cnxImageUrl)
        
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
