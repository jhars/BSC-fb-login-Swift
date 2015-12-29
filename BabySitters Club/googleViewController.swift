//
//  googleViewController.swift
//  BabySitters Club
//
//  Created by Jon Harlan on 12/29/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class googleViewController: UIViewController {
//    @IBOutlet weak var activityWheel: UIActivityIndicatorView!
    var articles = [googleArticle]()
    
    var currentUserId:String = ""
    var tempFireBaseUrlForCurrentUser:String = ""
    var cnxImageUrl:String = ""
    var tableData = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        activityWheel.startAnimation()
        returnUserData()  
        
        let url = "http://ajax.googleapis.com/ajax/services/search/news"
        let parameters = ["v": "1.0", "q": "Barack Obama"]
        
        Alamofire.request(.GET, url, parameters: parameters)
            .responseJSON { response in
                // gets the json
//                if let JSON = response.result.value {
                    //                    print("JSON: \(JSON)")
                    
                    //GET list of Single Articles
//                    let articleDictionaries = JSON.valueForKey("responseData")?.valueForKey("results") as! [NSDictionary]
                    
                    //extracts SPECIFIC DATA we want
//                    self.articles = articleDictionaries.map {
//                        googleArticle(title: $0["titleNoFormatting"] as! String, publisher: $0["publisher"] as! String)
//                    }
//                    print(self.articles[1].publisher)
                
//                    self.performSegueWithIdentifier("showNewsSegue", sender: nil)
//                }
        }
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
                    var urlData = sitterObjDict.valueForKey("image-url") as! String
                    var nameData = sitterObjDict.valueForKey("name") as! String
                    var cnxData = sitterObjDict.valueForKey("cnx-score") as! Int

//                    var imgUrl = sitterObjDict.valueForKey("img-url") as! NSDictionary
                    print(nameData)
                    print(cnxData)
                    print(urlData)
//                    print(sitterObjDict)

//                    print(imgUrl)
//                    let articleDictionaries = sitterObjDict.valueForKey("img-url") as! [NSDictionary]
//                    print(articleDictionaries)
//                    self.articles = sitterObjDict.map {_,_ in
//                    var articleTitle = sitterObjDict
                    
//                        googleArticle(title: ["image-url"] as! String, publisher: ["name"] as! String)
//                    }
//
                    //RUN NEXT FUNCTION
                    //                    self.getJpgImagesFromUrl(sitterObjDict)
//
                    
//                    var AlamofireRef = data
                    
//                    Alamofire.request(.GET, data)
//                        .responseImage { response in
//                            debugPrint(response)
//                            
//                            print(response.request)
//                            print(response.response)
//                            debugPrint(response.result)
//                            
//                            if let image = response.result.value {
//                                self.tableData.append(image as UIImage)
//                            }
//                    }
//                    print(self.tableData)
                })
            }
        })
    }

    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let newsTVC = segue.destinationViewController as! googleNewsTableViewController
//        newsTVC.articles = articles
//    }
    
    
}

