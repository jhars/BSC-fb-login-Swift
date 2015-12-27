//
//  AlamoFireImageVC.swift
//  BabySitters Club
//
//  Created by Jon Harlan on 12/27/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//
import Alamofire
import AlamofireImage
import UIKit

class AlamoFireImageVC: UIViewController {
    
    let AlamoRef = Alamofire.request(.GET, "https://scontent.xx.fbcdn.net/hprofile-xpt1/v/t1.0-1/p50x50/12190919_10102581058954074_1908735207991004359_n.jpg?oh=2e458b46499f38c47d50a324a30c0ad8&oe=5716104D")
    
    
    @IBOutlet weak var AlamoImage: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        AlamoRef.responseImage { response in
            debugPrint(response)
            
            print(response.request)
            print(response.response)
            debugPrint(response.result)
            
            if let image = response.result.value {
                print("image downloaded: \(image)")
                self.AlamoImage.image = image
            }
        }
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
