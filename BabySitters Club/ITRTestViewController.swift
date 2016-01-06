//
//  ITRTestViewController.swift
//  BabySitters Club
//
//  Created by Jon Harlan on 1/4/16.
//  Copyright © 2016 Jon Harlan. All rights reserved.
//

import UIKit
import ITRFlipper

//let itrFlipper: ITRFlipper

//

//var secondViewController: SecondViewController
//var thirdViewController: ThirdViewController
var sbStoryboard = UIStoryboard(name: "Main", bundle: nil)


class ITRTestViewController: UIViewController {

    var firstVC = sbStoryboard.instantiateViewControllerWithIdentifier("FirstViewController") as! UIView
    var secondVC = sbStoryboard.instantiateViewControllerWithIdentifier("SecondtViewController") as! UIView
    var thirdVC = sbStoryboard.instantiateViewControllerWithIdentifier("SecondViewController") as! UIView
    


    //1.0,1.0,1.0,1.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let itrFlipper = ITRFlipper()
        
        itrFlipper.backgroundColor = UIColor.clearColor()
        itrFlipper.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]

        self.view!.addSubview(itrFlipper)

        

    }
    
    func numberOfPagesinFlipper(pageFlipper: ITRFlipper) -> Int {
            return 10
    }
    
    func viewForPage(page: Int, inFlipper flipper: ITRFlipper) -> UIView {
        if page %  3 == 0 {

            return self.firstVC
            
//            performSegueWithIdentifier("firstFlip", sender: nil)
        } else if page % 3 == 1 {
            return self.secondVC
        } else {
            return self.thirdVC
        }
    }

    
    
    
    
    
//    var storyboard: UIStoryboard = UIStoryboard.storyboardWithName("Main", bundle: nil)
    
//    self.firstViewController = storyboard.instantiateViewControllerWithIdentifier(NSStringFromClass(FirstViewController.class))

    
    
    
    //    self.secondViewController = storyboard.instantiateViewControllerWithIdentifier(NSStringFromClass(SecondViewController.class))
//    self.thirdViewController = storyboard.instantiateViewControllerWithIdentifier(NSStringFromClass(ThirdViewController.class))
    //flipper view


    
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
//        var destVC = segue.destinationViewController as! FirstViewController
//        destVC.
//    }


}
