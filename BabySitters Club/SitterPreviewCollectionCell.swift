//
//  SitterPreviewCollectionCell.swift
//  
//
//  Created by Jon Harlan on 1/2/16.
//
//

import UIKit

class SitterPreviewCollectionCell: UICollectionViewCell {
    
    @IBOutlet weak var sitterProfilePic: UIImageView!

    @IBOutlet weak var sitterProfileName: UILabel!
    @IBOutlet weak var sitterProfileCnx: UILabel!
    @IBOutlet weak var sitterProfileSchedPreview: UILabel!
    
    @IBAction func didFavoriteSitter(sender: AnyObject) {
    }
    
}
