//
//  Home.swift
//  BabySitters Club
//
//  Created by Jon Harlan on 12/15/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//

import Foundation

class Home : UIViewController {
    override func viewDidLoad() {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
         print ("the pan")
    }
   

}