//
//  ViewController.swift
//  BabySitters Club
//
//  Created by Jon Harlan on 12/2/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//


import UIKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (FBSDKAccessToken.currentAccessToken() != nil)
        {
            print("already logged in")
        let loginView : FBSDKLoginButton = FBSDKLoginButton()
        self.view.addSubview(loginView)
        //            loginView.center = self.view.center
        let Y_Position:CGFloat? = 500.0 //use your Y position here

        let X_Co = ((self.view.frame.size.width - loginView.frame.width)/2 - 60)
        
        loginView.frame = CGRectMake(X_Co, Y_Position!, 300, 40)
        
        loginView.readPermissions = ["public_profile"]
        loginView.delegate = self
        }
        else
        {
            print("Error: No Facebook Access Token Find, You Must Login First!")
        }
    
    }

    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        print("User Logged In")
        
        if ((error) != nil)
        { // Process error
           
        } else if result.isCancelled {
            // Handle cancellations
        } else {
            // If you ask for multiple permissions at once, you
            // should check if specific permissions missing
            if result.grantedPermissions.contains("name") {
                print("email found")
                self.performSegueWithIdentifier("showNew", sender: self)
                returnUserData()
            }
        }
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("User Logged Out")
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
    }
}

