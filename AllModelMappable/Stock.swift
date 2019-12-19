//
//  Stock.swift
//  bambook
//
//  Created by Admin on 18/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import ObjectMapper

struct Stocks:Mappable {
    var id:Int?
    var title:String?
    var subTitle:String?
    var image:String?
    var link:Any?
    var description:String?
    var is_active:Bool?
    var end_data:String?
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        subTitle <- map["subtitle"]
        image <- map["image"]
        link <- map["link"]
        description <- map["description"]
        is_active <- map["is_active"]
        end_data <- map["end_date"]
    }
    
    init?(map: Map) {
    }
}
