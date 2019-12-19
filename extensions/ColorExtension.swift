//
//  ColorExtension.swift
//  bambook
//
//  Created by Admin on 23/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
    // background color
    class func mainColor()->UIColor {
        return UIColor(red: 0.04, green: 0.11, blue: 0.2, alpha: 1.0)
    }
    // color rectangles
    class func colorRectangle()->UIColor {
        return UIColor(red: 0.8, green: 0.56, blue: 0.08, alpha: 1.0)
    }
    // text color for textField
    class func colorTextField()->UIColor {
        return UIColor(red: 0.36, green: 0.47, blue: 0.6, alpha: 1)
    }
    
    // border color for textField
    class func colorBorderTextField()->CGColor {
        return UIColor(red: 0.36, green: 0.47, blue: 0.6, alpha: 1).cgColor
    }
}



//MARK: - test corner radius i return to point sometime
