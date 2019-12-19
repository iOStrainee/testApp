//
//  Slider.swift
//  bambook
//
//  Created by Admin on 09/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import ObjectMapper

struct Slider:Mappable {
    var id:Int?
    var sliderType:String?
    var image:String?
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        sliderType <- map["slider_type"]
        image <- map["image"]
    }
    
    init?(map: Map) {
    }
}
