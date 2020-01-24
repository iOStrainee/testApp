//
//  Modell.swift
//  bambook
//
//  Created by Admin on 24/01/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import Foundation
import UIKit

struct StockModel: DataMappable {
    var id:Int
    var title:String
    var subTitle:String
    var image:String
    var link:Any?
    var description:String
    var is_active:Bool
    var end_data:String
    
    init(id:Int = 0, title:String = "", subtitle:String = "", img:String = "", descrip:String = "", active:Bool=false, enddata:String = "") {
        self.id = id
        self.title = title
        self.subTitle = subtitle
        self.image = img
        self.description = descrip
        self.is_active = active
        self.end_data = enddata
    }
}
