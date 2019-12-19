//
//  UITextFieldExtension.swift
//  bambook
//
//  Created by Admin on 13/12/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

//MARK: - Advice if you will be use CATansformTranslate3d , it's not will right solving

import Foundation
import UIKit

//MARK: - inset text content
extension UITextField {
    func moveContent() {
        
        let viewLeft = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 50.0, height: self.frame.height))
        viewLeft.backgroundColor = backgroundColor
        self.leftView = viewLeft
        self.leftViewMode = .always
        
        let viewRight = UIView(frame: CGRect(x: 0.0, y: 0.0, width: 20.0, height: self.frame.height))
        viewRight.backgroundColor = backgroundColor
        self.rightView = viewRight
        self.rightViewMode = .always
    }
    func placeholderColorChange(requiredPlaceholderString placeholderTemp:String) {
        attributedPlaceholder = NSAttributedString(string: placeholderTemp, attributes: [NSAttributedString.Key.foregroundColor : UIColor(red: 0.36, green: 0.47, blue: 0.6, alpha: 1)])
    }
}

