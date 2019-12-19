//
//  Garnishes.swift
//  bambook
//
//  Created by Admin on 21/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import ObjectMapper

struct Garnishes:Mappable {
    var id:Int?
    var name:String?
    var photo:String?
    var output:String?
    var price:String?
    var description:String?
    var with_additives:Bool?
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        photo <- map["photo"]
        output <- map["output"]
        price <- map["price"]
        description <- map["description"]
        with_additives <- map["with_additive"]
    }
}
