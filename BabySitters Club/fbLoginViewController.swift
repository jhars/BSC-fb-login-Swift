import UIKit

class fbLoginViewController: UIViewController {

    @IBAction func userFbData(sender: UIButton) {
        var userFbookData = self.returnUserData()
    }
// ===>>> IB-Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var sitterStatus: UISegmentedControl!

    var sitterOrNot:Bool = false
    var currentDate = NSDate()
//  FIREBASE
    var ref = Firebase(url: "https://sitterbookapi.firebaseio.com/")
    @IBAction func parentOrSitter(sender: UISegmentedControl) {
        switch sitterStatus.selectedSegmentIndex{
        case 0:
            sitterOrNot = false
            print("SitterStatus = False")
        case 1:
            print("SitterStatus = True")
            sitterOrNot = true
        default:
            break;
        }
    }
    // __________________________________________________________________________ //
    // ______________________VIEW DID LOAD_______________________________________ //
    // __________________________________________________________________________ //
    override func viewDidLoad() {
        super.viewDidLoad()
        zipTextField.text = "12345"
        emailTextField.text = "test@sitterbook.com"
    }
    
    func returnUserData() {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            if ((error) != nil)
            { print("Error: \(error)")
            } else {
                let userID : NSString = result.valueForKey("id") as! NSString
                print("User ID is is: \(userID)")
                
//                let newData = userID
                let userName : NSString = result.valueForKey("name") as! NSString
                print("User Name is: \(userName)")
//Create New User SignUp/Login on FireBase
                let userEmail = self.emailTextField.text! as String
                let userZip = self.zipTextField.text! as String
                let userSitterStatus = self.sitterOrNot as Bool
                //ZIP CODE on Sign Up / Login
//                let newZip = [ "zipIndex" : userZip as String]
//=======Update USer INfo FireBase Ref ===========//
                
                let updateUserInfoUrl = "https://sitterbookapi.firebaseio.com/users/" + (userID as String)
                var updateUserInfoRef = Firebase(url: updateUserInfoUrl)

                //_________________________________________________//
//FreBAse OAuth Signup & Login
                self.ref.createUser(userEmail, password: "1111", withValueCompletionBlock:{(result) -> Void in
//                    print("success sign up!"); print("User has been Created, result is \(result)")
                    self.ref.authUser(userEmail, password:"1111", withCompletionBlock: { (authData) -> Void in
// ===== DATA WRITING ROUTES =========== //
//                        self.ref.childByAppendingPath("users").childByAppendingPath(userID as String).setValue(userName as String)
                        
                        updateUserInfoRef.updateChildValues(["user-name": userName])
                        updateUserInfoRef.updateChildValues(["email": userEmail])
                        updateUserInfoRef.updateChildValues(["sitter": userSitterStatus])
                        updateUserInfoRef.updateChildValues(["zip": userZip])
                        
//                        self.ref.childByAppendingPath("users/\(userID as String)/name").setValue(userName as String)
//                        self.ref.childByAppendingPath("users/\(userID as String)/email").setValue(userEmail as String)
//                        self.ref.childByAppendingPath("users/\(userID as String)/sitter").setValue(userSitterStatus as Bool)
//  MULTIPLE ZIP CODES
//  self.ref.childByAppendingPath("users/\(userID as String)/zip").setValue(userZip as String)
//                        self.ref.childByAppendingPath("users/\(userID as String)/zip").updateChildValues(newZip)
//                self.ref.childByAppendingPath("users/\(userID as String)/zip").updateChildValues(userZip)
                    })
                })
            }
        })
    }
// ******************* SIGN-UP ********************** //
    func signUp(sender: AnyObject) {
//        if emailTextField.text == "" || passwordTextField.text == "" {
//            print("make sure to enter in each textfield")
//        } else {
            // ===== Sign Up Logic Here ======== //
//        }
    }
// ********************************************************** //

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
