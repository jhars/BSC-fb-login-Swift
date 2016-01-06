//
//  NodeFacebookLoginVC.swift
//  BabySitters Club
//
//  Created by Jon Harlan on 1/5/16.
//  Copyright © 2016 Jon Harlan. All rights reserved.
//

import UIKit
import SafariServices

class NodeFacebookLoginVC: UIViewController, SFSafariViewControllerDelegate {
    
    private var urlString:String = "https://nexu.herokuapp.com"
    
    //MARK: Lifecycle
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func safariViewControllerDidFinish(controller: SFSafariViewController)
    {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //MARK: Web Content Presenting

    @IBAction func openInSafari(sender: AnyObject) {
                //TODO: Open in native safari
        let url = NSURL(string: self.urlString)!
        UIApplication.sharedApplication().openURL(url)
    }

    
    
    @IBAction func openInSafariVC(sender: AnyObject) {

        
        let svc = SFSafariViewController(URL: NSURL(string: self.urlString)!)
        svc.delegate = self
        self.presentViewController(svc, animated: true, completion: nil)
    }


    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if let navVC = segue.destinationViewController as? UINavigationController
        {
            let cwvc = navVC.topViewController as! CustomWebViewController
            cwvc.urlString = self.urlString
        }
    }
    

}
