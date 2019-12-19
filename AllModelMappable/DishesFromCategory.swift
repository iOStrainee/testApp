//
//  DishesFromCategory.swift
//  bambook
//
//  Created by Admin on 21/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import ObjectMapper

struct DishesFromCategory:Mappable {
    var id:Int?
    var dishes:[Dishes]?
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        dishes <- map["dishes"]
    }
    
    init?(map: Map) {
        
    }
}
