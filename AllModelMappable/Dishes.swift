//
//  Dishes.swift
//  bambook
//
//  Created by Admin on 07/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import ObjectMapper

struct Dishes:Mappable{
    var typeCell:TypeCell = .normal
    var id:Int?
    var name:String?
    var slug:String?
    var photo:String?
    var output:String?
    var price:String?
    var description:String?
    var with_garnish:Bool = false
    var with_additive:Bool?
    var isNew:Bool = false
    var category:Int?
    var garnishes:[Garnishes]?
    var additivies:[Additivies]?
    
    init?(map: Map) {
    }
    mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        slug <- map["slug"]
        photo <- map["photo"]
        output <- map["output"]
        price <- map["price"]
        description <- map["description"]
        with_garnish <- map["with_garnish"]
        with_additive <- map["with_additive"]
        isNew <- map["is_new"]
        category <- map["category"]
        garnishes <- map["garnishes"]
        additivies <- map["additives"]
    }
}
