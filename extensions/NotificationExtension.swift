//
//  NotificationExtension.swift
//  bambook
//
//  Created by Admin on 10/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation


//MARK: add custom notification names for all cases on that app
extension NSNotification.Name {
    static let toBasket = NSNotification.Name("addToBasket") // for button Cart
    static let dataForHeaderSlider = NSNotification.Name("slider") // may be i will be use
    static let hasError = NSNotification.Name("error") // may be i will be use
}
