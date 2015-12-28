//
//  SitterDataViewController.swift
//  BabySitters Club
//
//  Created by Jon Harlan on 12/28/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//

import Alamofire
import AlamofireImage
import UIKit

class SitterDataViewController:  UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    //---------------------- //
    // URL -> IMAGE:LOADER  //
    //----------------------//
    
    @IBOutlet weak var imageCollectionView: UICollectionView!
    
    @IBAction func refreshImages(sender: AnyObject) {
                getAllImagUrlsFromFireBase (tempFireBaseUrlForCurrentUser)
        
    }

    
    // =============== DATA ====================//
    var currentUserId:String = ""
    var tempFireBaseUrlForCurrentUser:String = ""
    var cnxImageUrl:String = ""
    var tableData = [UIImage]()
    // =============== DATA ====================//
    
    
    //***********************************************************************//
    //                 _________LOGIC__________                             //
    
    func getImgFromFireBaseUrl(imgUrlString:String) {
//        print(self.tableData)

        
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
//                debugPrint(response)
//                
//                print(response.request)
//                print(response.response)
//                debugPrint(response.result)
                
                if let image = response.result.value {
                    //                    print("image downloaded: \(image)")
                    
                    //                    self.imgProtoOne.image = image
                    self.tableData.append(image as UIImage)
                }
        }
        print(self.tableData)
        
    }
    
//    func refreshImagesOnPage (imageArray:NSArray) {
//     getJpgImagesFromUrl(
//    }
    //                 _________LOGIC__________                             //
    //***********************************************************************//
    
    // OVERRIDE STUFF -- override dunc tableView(...    //
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //Table Data
        return self.tableData.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = imageCollectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! SitterCollectionViewCell
        //Table Data
        
        cell.imageView!.image = self.tableData[indexPath.row]
//        print(self.tableData)

        return cell
    }
//    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        self.performSegueWithIdentifier("showImage", sender: self)
//    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        if segue.identifier == "showImage"{
//            let indexPaths = self.collectionView!.indexPathsForSelectedItems()!
//            let indexPath = indexPaths[0] as NSIndexPath
//            let vc = segue.destinationViewController as! NewViewController
//            //Table Data
//            vc.image = self.t[indexPath.row]!
//            vc.title = self.appleProducts[indexPath.row]
//        }
//    }
    // -----------------------      VIEW-DID-LOAD   ------------------------ //
    //   INITIALIZER (Action)
    override func viewDidLoad() {
        super.viewDidLoad()
        findFaceBookId()
        //Break Point
        //what did they callon the View Did Load (see original collection view demo)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }  // -----------------------      VIEW-DID-LOAD   ------------------------ //
}


