import UIKit

class fbLoginViewController: UIViewController {

    @IBAction func userFbData(sender: UIButton) {
        print("data here")
        var userFbookData = self.returnUserData()
        print(userFbookData)
        print("data here 02")
    }

    // ______________________VIEW DID LOAD_______________________________________ //
    // __________________________________________________________________________ //
    // __________________________________________________________________________ //
    // __________________________________________________________________________ //
    // __________________________________________________________________________ //
    
    var ref = Firebase(url: "https://sitterbookapi.firebaseio.com/")
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var zipTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    func returnUserData()
    {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {
                // Process error
                print("Error: \(error)")
            }
            else
            {
                print("fetched user: \(result)")

                let userID : NSString = result.valueForKey("id") as! NSString
                print("User ID is is: \(userID)")
                
                var newData = userID
//                var postRef = self.ref.childByAppendingPath("Posts")
//                var newDataValue = newData as String!
//                var newPostRef = postRef.childByAutoId()
//                newPostRef.setValue(newDataValue)
                
                let userName : NSString = result.valueForKey("name") as! NSString
                print("User Name is: \(userName)")
//                let fbUserName = userName as! String
                
                //Create New User SignUp/Login on FireBase
                
                var userEmail = self.emailTextField.text! as String
                var userZip = self.zipTextField.text! as String
                

            self.ref.createUser(userEmail, password: "1111", withValueCompletionBlock:{(result) -> Void in
                    print("success sign up!")
//                    var userID = result.uid
                    print(result)
                    print("result above")

                                            
                self.ref.authUser(userEmail, password:"1111", withCompletionBlock: { (authData) -> Void in
//                    var userId = authData.uid
                    let newUser = [
                        "provider": "1111",
                        "email": userEmail as? String,
                        "fbID": userName as? String
                    ]
                    // ===== BREAKING POINT =========== //
//                    
//                    let fakePost = [
//                        "\(NSDate())" : "this is my 1st fake post"
//                    ]
                    self.ref.childByAppendingPath("users").childByAppendingPath(userID as String).setValue(userName as String)
                    
                    self.ref.childByAppendingPath("users/\(userID as String)/name").setValue(userName as String)
                    
                    self.ref.childByAppendingPath("users/\(userID as String)/zip").setValue(userZip as String)
                    
                })
            })
        }
    })
    }
        
                
    // ********************************************************** //
    // ******************* LOGIN / SIGN-UP ********************** //
    // - - - - - - -  - - - - -  - - - - - -  - - - - - -  - - -  //
    

    
    
    func signUp(sender: AnyObject) {
        
//        if emailTextField.text == "" || passwordTextField.text == "" {
//            print("make sure to enter in each textfield")
//        } else {
            // ===== Sign Up Logic Here ======== //
//        }
        
    }
    
    
    
    // - - - - - - -  - - - - -  - - - - - -  - - - - - -  - - -  //
    // ******************* LOGIN / SIGN-UP ********************** //
    // ********************************************************** //

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
