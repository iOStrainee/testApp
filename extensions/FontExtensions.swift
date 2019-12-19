//
//  AllExtensions.swift
//  bambook
//
//  Created by Admin on 10/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    //MARK: - Roboto-regular with size = 13.0
    class func roboto13()->UIFont{
        let custom = UIFontDescriptor(name: "Roboto-regular", size: 0.0) // after we change size
        let temp = UIFont(descriptor: custom, size: 13.0)
        return temp
    }
    
    //MARK:- Roboto-bold
    class func robotoBold13()->UIFont {
        let custom = UIFontDescriptor(name: "Roboto-Bold", size: 13.0)
        let temp = UIFont(descriptor: custom, size: 13.0)
        return temp
    }
    
    //MARK: - AppetiteNew-Regular
    class func appetite24()->UIFont {
        let custom = UIFontDescriptor(name: "AppetiteNew-Regular", size: 0.0)
        let temp = UIFont(descriptor: custom, size: 24.0)
        return temp
    }
}
