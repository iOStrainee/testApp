//
//  CartModel.swift
//  bambook
//
//  Created by Admin on 18/01/2020.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class CartModel: NSObject, ResourceData {
    
    weak var delegate: ViewModelDelegate? // reference to object which conform ViewModelDelegate protocol
    var cartContainer:[Cart] = []
    
    var countRow: Int {
        return cartContainer.count
    }
    init(delegate:ViewModelDelegate? = nil) {
        self.delegate = delegate
        super.init()
        self.addObserver() // here we subscribe to notification
    }
    deinit {
        print("deiinitialize \(#function)")
        NotificationCenter.default.removeObserver(self) // this is line is must have required after your as subscribe notification
    }
}

//MARK: - conforms to protocol delegate ResourceData
extension CartModel {
    
    //MARK: add observer and setting selector
    private func addObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(receiverDataNotification(note:)), name: NSNotification.Name.toBasket, object: nil)
    }
    
    //MARK: - selector for notification
    @objc private func receiverDataNotification(note:Notification){
        var cartData = Cart()
        
        if let data = note.object as? [String:Any] {
            if let type = data["type"] as? TypeCell {
                cartData.type = type
            }
            if let name = data["name"] as? String {
                cartData.name = name
            }
            if let price = data["price"] as? Int, price > 0 {
                cartData.price = price
            }
            if let image = data["image"] as? UIImage {
                cartData.image = image
            }
            
            self.cartContainer.append(cartData) // add to container
        }
    }
}
