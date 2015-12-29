//
//  CatsViewController.swift
//  BabySitters Club
//
//  Created by Jon Harlan on 12/28/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//

import UIKit

class CatsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var myCollectionView: UICollectionView!
    
    var images = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        loadImages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        //CatsMyCollectionViewCel
        
        
        let myCell:CatsMyCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("myCell", forIndexPath: indexPath) as! CatsMyCollectionViewCell
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
            let imageString = self.images[indexPath.row]
            let imageUrl = NSURL(string: imageString)
            let imageData = NSData(contentsOfURL: imageUrl!)
            
            dispatch_async(dispatch_get_main_queue(),{
                if(imageData != nil){
                    myCell.myImageView.image = UIImage(data:imageData!)
                    let startTime = NSDate.timeIntervalSinceReferenceDate()
                    
                    var pageUrl = "http://www.kaleidosblog.com/tutorial/get_images?uudi=" + NSUUID().UUIDString
                    let myUrl = NSURL(string: pageUrl);
                    let request = NSMutableURLRequest(URL:myUrl!);
                    
                    let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
                        data, response, error in
                        
                        
                        
                        do {
                            
                            var myAlert = UIAlertController(title:"Alert", message:error?.localizedDescription, preferredStyle: UIAlertControllerStyle.Alert)
                            let okAction = UIAlertAction(title:"Ok", style: UIAlertActionStyle.Default, handler: nil)
                            myAlert.addAction(okAction)
                            self.presentViewController(myAlert, animated: true, completion: nil)
                            
                            let jsonArray = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                            
                            
                            self.images = jsonArray as! [String]
                            dispatch_async(dispatch_get_main_queue(),{
                                self.myCollectionView.reloadData()
                            });
                            
                        } catch let error as NSError? {
                            print("JSON Error: \(error!.localizedDescription)")
                        }
                    }
                    task.resume();
                }

            });
        });

        return myCell
    }
    
    
    
    
    
    
    
    
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        print("User tapped on index # \(indexPath.row)")
    }
    
    func loadImages(){
        

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
