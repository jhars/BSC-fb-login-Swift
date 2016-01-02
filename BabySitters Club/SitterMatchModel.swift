//
//  sitterMatchModel.swift
//  BabySitters Club
//
//  Created by Jon Harlan on 12/29/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//

import Foundation

class SitterMatchModel: NSObject {
    var name:String?
    var cnxScore:Int?
    var img:UIImage?
    
    init(name:String, cnxScore:Int,img:UIImage) {
        self.name = name
        self.cnxScore = cnxScore
        self.img = img
    }
}