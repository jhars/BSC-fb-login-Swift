//
//  ViewController.swift
//  BabySitters Club
//
//  Created by Jon Harlan on 12/2/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//


import UIKit
//import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        if (FBSDKAccessToken.currentAccessToken() != nil)
//        {
//             User is already logged in, do work such as go to next view controller.
//            print("already logged in")
//            self.performSegueWithIdentifier("showMenu", sender: self)
//            returnUserData()
//        }
//        else
//        {
            let loginView : FBSDKLoginButton = FBSDKLoginButton()
            self.view.addSubview(loginView)
            loginView.center = self.view.center
            loginView.readPermissions = ["public_profile"]
            loginView.delegate = self
//        }
    
    }

    
    
    
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")
        
        if ((error) != nil)
        {
            // Process error
        }
        else if result.isCancelled {
            // Handle cancellations
        }
        else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("name")
            {
                print("email found")
//                self.returnUserData()
                self.performSegueWithIdentifier("showNew", sender: self)
//                self.returnUserData()
                returnUserData()
              
                
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
    }
    

    
    func sendFacebookDATAtoFireBaseDB () {
        //            var msg = msgInput.text
        //
        //            var postRef = self.ref.childByAppendingPath("Posts")
        //            var newMsgValue = msg as String!
        //            var newPostRef = postRef.childByAutoId()
        //            newPostRef.setValue(newMsgValue)
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
            }
        })
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

