//
//  googleViewController.swift
//  BabySitters Club
//
//  Created by Jon Harlan on 12/29/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//

import UIKit
import Alamofire

class googleViewController: UIViewController {
//    @IBOutlet weak var activityWheel: UIActivityIndicatorView!
    var articles = [googleArticle]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        activityWheel.startAnimation()
        
        let url = "http://ajax.googleapis.com/ajax/services/search/news"
        let parameters = ["v": "1.0", "q": "Barack Obama"]
        
        Alamofire.request(.GET, url, parameters: parameters)
            .responseJSON { response in
                // gets the json
                if let JSON = response.result.value {
                    //                    print("JSON: \(JSON)")
                    
                    //GET list of Single Articles
                    let articleDictionaries = JSON.valueForKey("responseData")?.valueForKey("results") as! [NSDictionary]
                    
                    //extracts SPECIFIC DATA we want
                    self.articles = articleDictionaries.map {
                        googleArticle(title: $0["titleNoFormatting"] as! String, publisher: $0["publisher"] as! String)
                    }
                    print(self.articles[1].publisher)
                    
                    self.performSegueWithIdentifier("showNewsSegue", sender: nil)
                }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let newsTVC = segue.destinationViewController as! googleNewsTableViewController
        newsTVC.articles = articles
    }
    
    
}

