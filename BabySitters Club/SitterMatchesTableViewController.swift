//  SitterMatchesTableViewController.swift
//  BabySitters Club

import UIKit
import Alamofire
import AlamofireImage

//var imageArray = [UIImage]()

class SitterMatchesTableViewController: UITableViewController {

//    let reverseImgArray:Array = imageArray.reverse()
    
//    var models = [SitterMatchModel]()
    var sitterImages = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        print(models)


        print("image ARRAY below::--->>>>")
        

        
         print("image ARRAY is Above ^^^^^^^")
}
    
    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sitterMatchModelName.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("sitterCell", forIndexPath: indexPath)

        let name = sitterMatchModelName[indexPath.row]
        let score = String(sitterMatchModelScore[indexPath.row])

        let img = imageArray[indexPath.row]

        
//        let img = self.reverseImgArray[indexPath.row]
//        let sitterImg = sitterMatchModelImage[indexPath.row]
        
        cell.textLabel!.text = name
        cell.detailTextLabel!.text = score
        cell.imageView!.image = img
        return cell
    }

}
