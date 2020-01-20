//
//  Cart.swift
//  bambook
//
//  Created by Admin on 20/01/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit

struct Cart {
    
    var type:TypeCell
    var name:String
    var price:Int
    var image:UIImage?
    
    init(type:TypeCell = .normal,name:String = "",price:Int = 0, image:UIImage? = nil) {
        self.type = type
        self.name = name
        self.price = price
        self.image = image
    }
}
