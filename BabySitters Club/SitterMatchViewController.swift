//  SitterMatchViewController.swift
//  BabySitters Club

import UIKit
import Alamofire
import AlamofireImage

var sitterMatchModelName = [String]()
var sitterMatchModelScore = [Int]()

var imageArray = [UIImage]()



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
                    print(sitterObjDict)
                    
                    sitterMatchModelName.append(sitterObjDict["name"] as! String)
                    
                    let  cnxScoreModel = sitterObjDict["cnx-score"]!
                    print(cnxScoreModel)
                    sitterMatchModelScore.append(cnxScoreModel as! Int)
                    //=================================================================\\
//                    var imgUrlModel = sitterObjDict["image-url"]

                    var sitterMatchModelImage = [String]()
                    
                    sitterMatchModelImage.append(sitterObjDict["image-url"] as! String)
                    
//                    print(sitterObjDict["name"] as! String)
                    

                    for IMAGEURL in sitterMatchModelImage{
                        print(IMAGEURL)
                        
                        var AlamoRef = Alamofire.request(.GET, IMAGEURL)
                        AlamoRef.responseImage { response in
                            debugPrint(response)
                            
                            print(response.request)
                            print(response.response)
                            debugPrint(response.result)
                            
                            if let image = response.result.value {
//                                print("image downloaded: \(image)")
//                                print(image as UIImage)
                                var imageAsUIImage = image as! UIImage
//                                imageArray.removeAll()
//                                imageArray.reverse()
                                
                                imageArray.append(imageAsUIImage)
//                                imageArray.reverse()
//                                imageArray[0] = imageAsUIImage
                                print(imageAsUIImage)

//                                imageArray.insert(imageAsUIImage, atIndex: 0)

                            }
                                
                        }
                    }

                    
                    
                    
                })
            }

            self.performSegueWithIdentifier("showSitter", sender: nil)
        })
    }
}
