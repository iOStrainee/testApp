//
//  Contacts.swift
//  bambook
//
//  Created by Admin on 08/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import ObjectMapper

struct Contacts:Mappable {
    var id:Int?
    var phone:String?
    var map_image:String?
    var map_description:String?
    var work_start:String?
    var work_end:String?
    var facebookLink:String?
    var instagram_link:String?
    var elsom:String?
    var balanceKg:String?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        phone <- map["phone"]
        map_image <- map["map_image"]
        map_description <- map["map_description"]
        work_start <- map["work_start"]
        work_end <- map["work_end"]
        facebookLink <- map["facebook_link"]
        instagram_link <- map["instagram_link"]
        elsom <- map["elsom"]
        balanceKg <- map["balance_kg"]
    }
}
