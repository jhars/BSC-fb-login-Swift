//
//  SlideMenuViewController.swift
//  BabySitters Club
//
//  Created by Jon Harlan on 12/14/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//

import UIKit


class SlideMenuViewController: UIViewController {

    
    @IBOutlet weak var Open: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        Open.target = revealViewController()
        Open.action = Selector("revealToggle:")
        
    }

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
