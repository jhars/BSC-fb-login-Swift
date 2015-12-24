//
//  orangeControllerViewController.swift
//  BabySitters Club
//
//  Created by Jon Harlan on 12/23/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//

import UIKit

class orangeController: UIViewController, SideBarDelegate {
    
    var sideBar:SideBar = SideBar()
    var menuItemArray = ["first item","Second Item","3rd Team"]
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = UIImage(named: "pack-BG")
        sideBar = SideBar(sourceView: view, menuItems: menuItemArray )
        sideBar.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sideBarDidSelectButtonAtIndex(index:Int){
        if index == 0 {
            imageView.backgroundColor = UIColor.redColor()
            imageView.image = nil
        } else if index == 1 {
            imageView.backgroundColor = UIColor.clearColor()
            imageView.image = UIImage(named: "side-panel")
        } else if index == 2 {
            imageView.backgroundColor = UIColor.clearColor()
            imageView.image = UIImage(named: "pack-BG")
        }
        
    }
    
    
}

