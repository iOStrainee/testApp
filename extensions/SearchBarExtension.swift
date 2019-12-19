//
//  SearchBarExtension.swift
//  bambook
//
//  Created by Admin on 11/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit

extension UISearchBar {
    var textFieldComputed:UITextField {
        guard let temp = self.value(forKey: "searchField") as? UITextField else {
            print("fail cust down")
            return UITextField()
        }
        temp.placeholder = "Поиск по блюдам"
        temp.attributedPlaceholder = NSAttributedString(string: temp.placeholder!, attributes: [NSAttributedString.Key.foregroundColor:UIColor(red: 0.36, green: 0.47, blue: 0.6, alpha: 1.0),NSAttributedString.Key.font: UIFont.roboto13()])
        temp.textColor = UIColor.white
        temp.font = UIFont.roboto13()
        return temp
    }
}
