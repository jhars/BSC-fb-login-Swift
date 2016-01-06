//  SitterMatchViewController.swift
//  BabySitters Club

import UIKit
import Alamofire
import AlamofireImage

var sitterMatchModelName = [String]()
var sitterMatchModelScore = [Int]()
var sitterModelObjects = [SitterMatchModel]()

class SitterMatchViewController: UIViewController {

    @IBOutlet weak var activityWheel: UIActivityIndicatorView!
    
    var currentUserId:String = ""
    var tempFireBaseUrlForCurrentUser:String = ""
    var cnxImageUrl:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        sitterModelObjects.removeAll()
        returnUserData()
        }
//=================================================================\\
    func returnUserData() {

        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        let task = graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {   // Process error
                print("Error: \(error)")
            } else {
                let userID : NSString = result.valueForKey("id") as! NSString
//                let accessToken : NSString = result.
                print("User ID is is: \(userID)")
                self.currentUserId = userID as String
                self.tempFireBaseUrlForCurrentUser = "https://sitterbookapi.firebaseio.com/users/" + (userID as String)

                let currentUserPath = self.tempFireBaseUrlForCurrentUser
                let firebaseRef = Firebase(url:(currentUserPath as String) + "/sitter-list/")
                
                firebaseRef.queryOrderedByValue().observeEventType(.ChildAdded, withBlock: { snapshot in
                    
                    //Need To ADD ERROR HANDLING HERE
                    
                    let sitterObjDict = snapshot.value as! NSDictionary
                    //=================================================================\\
                    let imgUrlModel = sitterObjDict["image-url"] as! String

                        let AlamoRef = Alamofire.request(.GET, imgUrlModel)
                        AlamoRef.responseImage { response in
                            debugPrint(response)
                            
                            print(response.request)
                            print(response.response)
                            debugPrint(response.result)
                            
                            if let image = response.result.value {
                                let sitterImageModel = image as! UIImage
                                let sitterNameModel = sitterObjDict["name"] as! String
                                let sitterScoreModel = sitterObjDict["cnx-score"] as! Int
                                let SitterObject = SitterMatchModel(name: sitterNameModel, cnxScore: sitterScoreModel, img: sitterImageModel)
                                sitterModelObjects.append(SitterObject)
                                self.performSegueWithIdentifier("showSitter", sender: nil)
                            }
                            AlamoRef.resume()
                        }
                })
            } // ----- END 'else' Statement --------------//


        }) // - - - - - - - - END Graph Request - - - - - - - - - - - - - - //
//                    task.resume()
    } //============================ END  func returnUserData() ============================== //
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let newsTVC = segue.destinationViewController as! SitterMatchesTableViewController
        newsTVC.models = sitterModelObjects
    }
}
