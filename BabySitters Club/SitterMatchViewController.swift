//  SitterMatchViewController.swift
//  BabySitters Club

import UIKit
import Alamofire
import AlamofireImage

var sitterMatchModelName = [String]()
var sitterMatchModelScore = [Int]()
var sitterMatchModelImage = [String]()
var imageArray = [UIImage]()
var sitterObject = [NSDictionary]()



class SitterMatchViewController: UIViewController {

    @IBOutlet weak var activityWheel: UIActivityIndicatorView!
    
    var currentUserId:String = ""
    var tempFireBaseUrlForCurrentUser:String = ""
    var cnxImageUrl:String = ""
    

    
//    var models = [SitterMatchModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
//        sitterMatchModelImage.removeAll()
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
                    sitterObject.append(sitterObjDict)
                    
                    sitterMatchModelName.append(sitterObjDict["name"] as! String)
//                    sitterObj["name"] = sitterObjDict["name"] as! String
//                    self.models[0].name = sitterObjDict["name"] as! String
                    
                    let  cnxScoreModel = sitterObjDict["cnx-score"]!
                    print(cnxScoreModel)
                    sitterMatchModelScore.append(cnxScoreModel as! Int)
//                    self.models[0].cnxScore = cnxScoreModel as! Int
                    //=================================================================\\
                    var imgUrlModel = sitterObjDict["image-url"] as! String


//                    self.cnxImageUrl = imgUrlModel
//                    sitterMatchModelImage.append(imgUrlModel)
                    
//                    print(sitterObjDict["name"] as! String)
//                    var tempImage:UIImage
                    
//                    for IMAGEURL in sitterMatchModelImage{
//                        print(IMAGEURL)
                    
                        var AlamoRef = Alamofire.request(.GET, imgUrlModel)
                        AlamoRef.responseImage { response in
                            debugPrint(response)
                            
                            print(response.request)
                            print(response.response)
                            debugPrint(response.result)
                            
                            if let image = response.result.value {
                                var imageAsUIImage = image as! UIImage
                                imageArray.append(imageAsUIImage)
                                print(imageAsUIImage)
//                                self.models[0].imgUrl = imageAsUIImage

                            }
                            
                        }
//                }
    
                })
            }

            self.performSegueWithIdentifier("showSitter", sender: nil)
        })
    }
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        let newsTVC = segue.destinationViewController as! SitterMatchesTableViewController
//        newsTVC.sitterImages = imageArray.reverse()
//    }
}
