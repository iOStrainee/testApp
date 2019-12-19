//
//  DishesCategory.swift
//  bambook
//
//  Created by Admin on 07/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import ObjectMapper

struct CategoryDishes:Mappable {
    //properties is optional because server may be return 404
    
    var id:Int?
    var name:String?
    var image:String?
    var slug:String?
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        image <- map["image"]
        slug <- map["slug"]
    }
    
    init?(map: Map) {
    }
}
