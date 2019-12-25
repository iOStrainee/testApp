//
//  ContactsViewModel.swift
//  bambook
//
//  Created by Admin on 15/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ContactsViewModel: NSObject,ResourceData {
    
    var contacts:Contacts?
    weak var delegate:ViewModelDelegate?
    
    init(delegate:ViewModelDelegate? = nil) {
        self.delegate = delegate
        super.init()
        self.loadData {[weak object = self] (temp) in
            if temp {
                object?.delegate?.didLoadAnimation()
            } else {
                object?.delegate?.hasError()
            }
        }
    }
    
    private func loadData(completionHandler: @escaping completion)->Void {
        self.delegate?.willLoadAnimation()                      // start animation load data
        Api.singleton.getContacts {[weak object = self] (contact, temp) in
            if temp {
                guard let data = contact else {
                    print("error retrieve data but success query")
                    completionHandler(false)
                    return
                }
                object?.contacts = data
                completionHandler(true)
            } else {
                print("error query")
                completionHandler(false)
            }
        }
    }
}
