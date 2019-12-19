//
//  Additivies.swift
//  bambook
//
//  Created by Admin on 21/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import ObjectMapper

struct Additivies:Mappable {
    
    var id:Int?
    var name:String?
    var photo:String?
    
    init?(map: Map) {}
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        photo <- map["photo"]
    }
}
