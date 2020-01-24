//
//  Model.swift
//  bambook
//
//  Created by Admin on 24/01/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit

struct ContactModel:DataMappable{
    var id: Int
    var phone:String
    var map_image:String
    var map_description:String
    var work_start:String
    var work_end:String
    var facebookLink:String
    var instagram_link:String
    var elsom:String
    var balanceKg:String
    
    init(id:Int = 0,phone:String = "", map_image:String = "",map_description:String = "",work_start:String = "",work_end:String = "", facebooklink:String = "", instagramlink:String = "", elsom:String = "",balancekg:String = "") {
        self.id = id
        self.phone = phone
        self.map_image = map_image
        self.map_description = map_description
        self.work_start = work_start
        self.work_end = work_end
        self.facebookLink = facebooklink
        self.instagram_link = instagramlink
        self.elsom = elsom
        self.balanceKg = balancekg
    }
}
