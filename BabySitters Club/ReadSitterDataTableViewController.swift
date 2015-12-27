//
//  ReadSitterDataTableViewController.swift
//  BabySitters Club
//
//  Created by Jon Harlan on 12/24/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//

import UIKit

//protocol ReadSitterDataTVCDelegate {
//    func returnUserData()
//}
class ReadSitterDataTableViewController: UITableViewController {

    @IBOutlet weak var testImage: UIImageView!
    
    //---------------------- //
    // URL -> IMAGE:LOADER  //
    //----------------------//
    
    //Key Variables:
    
    //=A=>    imageView: UIImageView! (@IBOutlet)
    //        ->Needs to be attached to aUIImageView on the Main.StoryBoard
    
    //=B=>    dataUrl = any Url for Single Image
    
    //=C=>    'imageView' - Read Lines 60-64
    
    //=================== DELEGATABLE ========================//
    // - -  - - - - - - - UI ImagView - - - - - -  - - - - - //
    // MARK: A
//    @IBOutlet weak var imageView: UIImageView!
    // MARK: B
    let dataUrl = "https://scontent.xx.fbcdn.net/hprofile-xpl1/v/t1.0-1/p50x50/17016_10205195417825534_5350715931583113657_n.jpg?oh=4d4de150626c1aecdf93ff6e7f6c0d9c&oe=57091762"
    //"h ttps://lh5.ggpht.com/tq3WqEUxtRyBn-d_0t3j6WKNHuJDrmLq-FE3GAYrsAMQFIaS7FIgRLfzzql2SvfvLqto=w300"
    
    //=================== DELEGATABLE ========================//
    // - - - - - - - - - - - - - - - - - - - - - - - - - \\
    // - - - - - - - - - - - - - - - - - - - - - - - - - - \\
    //======================== Custom ViewController Code Below ===================//
    //   INITIALIZER (Action)
    @IBAction func refreshSitters(sender: AnyObject) {

        //=================== DELEGATABLE ========================//
        requestImage(dataUrl) { (image) -> Void in
            let myImage = image
            
            //Last Piece of Custom Code! => 'imageView' as @IBOutlet
            // - -  - - - - - - - - - - - - - - - - - - - - - - - - - //
            // MARK: C   ->    UI ImageView
            self.testImage.image = myImage
        }   //     UI ImageView
        // - -  - - - - - - - - - - - - - - - - - - -  - - - - - //
        //        replace 'imageView' with whatever you named your '@IBOutlet / UIImageView' above
        //=================== DELEGATABLE ========================//
        
    }
//    this could be my Array of Initial URL Strings
    var tableData = [String]()
    
    // - -  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - //
    func requestURL(url: String, success: (NSData?) -> Void, error: ((NSError) -> Void)? = nil) {
        let session = NSURLSession.sharedSession()
        let url = NSURL(string: dataUrl)!
        
        session.dataTaskWithURL(url, completionHandler: { ( data: NSData?, response: NSURLResponse?, error: NSError?) -> Void in
            guard let realResponse = response as? NSHTTPURLResponse where
                realResponse.statusCode == 200 else {
                    print("Not a 200 response")
                    return
            }
            do {//--DATA--//
                success(data)
            }   //--DATA--//
        }).resume()
        //MORE SETUP OPTIONS HERE...
    }
    func requestImage(url: String, success: (UIImage?) -> Void) {
        requestURL(url, success: { (data) -> Void in
            if let d = data {
                success(UIImage(data: d))
            }
        })
    }
    // - -  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - //
    //============= Facebook Data - User ID ================= //
    func returnUserData() {
        let graphRequest : FBSDKGraphRequest = FBSDKGraphRequest(graphPath: "me", parameters: nil)
        graphRequest.startWithCompletionHandler({ (connection, result, error) -> Void in
            
            if ((error) != nil)
            {   // Process error
                print("Error: \(error)")
            } else {
                
                let userID : NSString = result.valueForKey("id") as! NSString
                print("User ID is is: \(userID)")
            }
        })
    }
    //============= Facebook Data ================= //
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    
    //========================================//
//    var ref = Firebase(url: "h ttps://sitterbookapi.firebaseio.com/")
    //========================================//
    //  1. Query FireBase using UserID for Image Urls
    //  2. Load Image Urls into Array
    //  3. For Each ImageUrl - LoadImages
    
    //Also Need Access to Photos on Device (iPhone)

    // - -  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -  //
    //======================== Custom ViewController Code Above ===================//
    // - -  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - //
    //_______________________________[{END CUSTOM CODE}]___________________________//

//   INITIALIZER (Action)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var fbUserData = self.returnUserData()

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
