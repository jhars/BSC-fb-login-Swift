//
//  sitterMatchModel.swift
//  BabySitters Club
//
//  Created by Jon Harlan on 12/29/15.
//  Copyright © 2015 Jon Harlan. All rights reserved.
//

import Foundation

class SitterMatchModel {
    var name:String?
    var cnxScore:Int?
    var imgUrl:UIImage?
    
    init(name:String, cnxScore:Int,imgUrl:UIImage) {
//    init(name:String, imgUrl:String) {
//    init(name:String) {
        self.name = name
        self.cnxScore = cnxScore
        self.imgUrl = imgUrl
    }
}