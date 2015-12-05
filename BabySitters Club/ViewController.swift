//
//  ViewController.swift
//  BabySitters Club
//
//  Created by Jon Harlan on 12/2/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
//        loginButton.center = self.view.center;
//        [self.view addSubview:loginButton];
        
        let loginButton = FBSDKLoginButton()
        loginButton.center = view.center
        view.addSubview(loginButton)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

