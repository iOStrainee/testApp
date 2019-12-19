//
//  AnchorConstraintExtension.swift
//  bambook
//
//  Created by Admin on 16/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
import UIKit

//MARK: - extension for anchor constraints layout
extension UIView {
    
    //MARK: - anchor layout fill superView
    func fillEntireScreen() {
        self.anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, trailing: superview?.trailingAnchor, bottom: superview?.bottomAnchor)
    }
    
    //MARK: - anchor layout equal widht and height
    func anchorEqualSize(toView:UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalTo: toView.heightAnchor).isActive = true
        widthAnchor.constraint(equalTo: toView.widthAnchor).isActive = true
    }
    
    //MARK: - anchor layout with padding with opional params
    func anchor(top:NSLayoutYAxisAnchor?,
                leading:NSLayoutXAxisAnchor?,trailing:NSLayoutXAxisAnchor?
        ,bottom:NSLayoutYAxisAnchor?
        ,padding:UIEdgeInsets = .zero,size:CGSize = .zero) {
        	
        translatesAutoresizingMaskIntoConstraints = false
        
        if let left = leading {
            leadingAnchor.constraint(equalTo: left, constant: padding.left).isActive = true
        }
        if let right = trailing {
            trailingAnchor.constraint(equalTo: right, constant: padding.right).isActive = true
        }
        if let up = top {
            topAnchor.constraint(equalTo: up, constant: padding.top).isActive = true
        }
        if let down = bottom {
            bottomAnchor.constraint(equalTo: down, constant: padding.bottom).isActive = true
        }
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
}
