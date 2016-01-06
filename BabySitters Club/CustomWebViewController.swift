//
//  CustomWebViewController.swift
//  BabySitters Club
//
//  Created by Jon Harlan on 1/5/16.
//  Copyright © 2016 Jon Harlan. All rights reserved.
//

import UIKit
import WebKit

class CustomWebViewController: UIViewController {
    var urlString:String?
    private var webView:UIWebView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        webView = UIWebView(frame: self.view.frame)
        var url:NSURL
        
        if let desiredURL = urlString
        {
            url = NSURL(string: desiredURL)!
        }
        else
        {
            url = NSURL(string: "https://www.google.com")!
        }
        
        webView.loadRequest(NSURLRequest(URL: url))
        self.view.addSubview(webView)
    }
    
    //Closes the browser and dismisses this view controller.

    @IBAction func done(sender: AnyObject) {
         self.dismissViewControllerAnimated(true, completion: nil)
    }
    


}
