//
//  MainCategoryMenuModel.swift
//  bambook
//
//  Created by Admin on 24/01/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit

struct CategoryDishModel:DataMappable{
    var id: Int
    var name:String
    var slug:String
    var image:String
    
    init(id:Int = 0,name:String = "", slug:String = "",image:String = "") {
        self.id = id
        self.name = name
        self.slug = slug
        self.image = image
    }
}
