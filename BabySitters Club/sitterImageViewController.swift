//
//  sitterImageViewController.swift
//  BabySitters Club
//
//  Created by Jon Harlan on 12/28/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//

import Alamofire
import AlamofireImage
import UIKit

class sitterImageViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
//----------------- // URL -> IMAGE:LOADER  \\ -------------------- //
//-----------------//   ( & Label Loader )   \\-------------------- //
    @IBOutlet weak var siCollectionView: UICollectionView!
    
    var collectionData = [UIImage]()
    
    var tempDictionary:NSDictionary!
    
//    var tableData =    [
//        UIImage(named:"calendar"),
//        UIImage(named:"connect"),
//        UIImage(named:"favorites"),
//        UIImage(named:"match-msg")
//    ]
//    let appleProducts = ["iPhone","Apple Watch","Mac","iPad Pro"]
// - - - - - - - - - -  \\  IMAGE:LOADER // - - - - - - - - - - - - - //
// - - - - - - - - - - - \\  [ <End> ]  // - - - - - - - - - - - - - //

// ======================== Data (Variables) ===================//
//    var tableData = [UIImage]()// == imageArray

    var currentUserId:String = ""
    var tempFireBaseUrlForCurrentUser:String = ""
    var cnxImageUrl:String = ""
// = = = = = = = = = = = = =[ Data <End> ]= = = = = = = = = = = = = //

// ---------------------------??? VIEW-DID-LOAD  ???---------------------------- //
    override func viewDidLoad() {
        super.viewDidLoad()
        //run this
        findFaceBookId()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
// - - - - - - - - - - - - - - [   VIEW-DID-LOAD <End>  ] - - - - - - - - - - - - - //
//____________________________________________________________________________//
// ________________________________LOGIC____Below_____________________________//
//____________________________________________________________________________//
    
//*********************************  Facebook Data - User ID *******************************//
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
                
//                self.getAllImagUrlsFromFireBase(self.tempFireBaseUrlForCurrentUser)
                
                
                
                var currentUserPath = self.tempFireBaseUrlForCurrentUser
                
                //        var sitterObjDict:NSDictionary!
                
                var firebaseRef = Firebase(url:(currentUserPath as String) + "/sitter-list")
                
                firebaseRef.queryOrderedByValue().observeEventType(.ChildAdded, withBlock: { snapshot in
                    //or Value
                    var sitterObjDict = snapshot.value as! NSDictionary
                    
                    self.tempDictionary = sitterObjDict
                    
                    var data = sitterObjDict.valueForKey("image-url") as! String
                    Alamofire.request(.GET, data)
                        .responseImage { response in
//                            debugPrint(response)
//                            
//                            print(response.request)
//                            print(response.response)
//                            debugPrint(response.result)
                            
                            if let image = response.result.value {
                                self.collectionData.append(image as UIImage)
                                print("image downloaded: \(image)")
                            }
                        }.resume()
                })
                print(self.collectionData)
                print("helllo ... Anything??")
            }
        })
    }
// * * * * * * * * * * * ** * * * * * * * Facebook Data End * * * * * * * * * * * * * * * * * * * * //

// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> Url -> IMAGE PROCESSOR <<<<<<<<<<<<<<<<<<<<<<<<<<//


//    }
// > > > > > > > > > > > > > > > > > > IMAGE PROCESSOR -- END < < < < < < < < < < < < < < < < //
    
// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ //
// -- OVERRIDE -- 'collectionView' -- FUNCTIONS --//
// ~~~~~~~~~~~ (Define Index Values) ~~~~~~~//

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

//        print(self.tableData)
//        return self.tableData.count
          return self.collectionData.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = siCollectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! sitterImageCollectionViewCell
//        print(self.tableData)
//        self.findFaceBookId()
//        print(self.collectionData)
        print("cellForItemAtIndexPath: \(self.collectionData)")
        
//        self.viewDidLoad()?
//        cell.SiImageView?.image = self.tableData[indexPath.row]
        cell.SiImageView?.image = self.collectionData[indexPath.row]
//        cell.SiTitleLabel?.text = self.appleProducts[indexPath.row]
        
        return cell
    }
// End ~~ OVERRIDE -- 'collectionView' -- FUNCTIONS ~~ End //
// ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ //

//_____________________________________________________________________________//
//____________________________ Custom Logic End _______________________________//
//_____________________________________________________________________________//
    
    
//================================================//
//================================================//
}
