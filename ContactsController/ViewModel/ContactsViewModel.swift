//
//  ContactsViewModel.swift
//  bambook
//
//  Created by Admin on 15/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ContactsViewModel: NSObject,ResourceData {
    
    var contactUnwrapped:ContactModel = ContactModel()
    private var contacts:Contacts?{
        didSet {
            self.unwrappedContacts()
        }
    }
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
    
    private func unwrappedContacts() {
        if let id = self.contacts?.id {
            self.contactUnwrapped.id = id
        }
        if let phone = self.contacts?.phone {
            self.contactUnwrapped.phone = phone
        }
        if let mapImage = self.contacts?.map_image {
            self.contactUnwrapped.map_image = mapImage
        }
        if let mapDescription = self.contacts?.map_description {
            self.contactUnwrapped.map_description = mapDescription
        }
        if let workStart = self.contacts?.work_start {
            self.contactUnwrapped.work_start = workStart
        }
        if let workend = self.contacts?.work_end {
            self.contactUnwrapped.work_end = workend
        }
        if let facebook = self.contacts?.facebookLink {
            self.contactUnwrapped.facebookLink = facebook
        }
        if let instagram = self.contacts?.instagram_link {
            self.contactUnwrapped.instagram_link = instagram
        }
        if let elsom = self.contacts?.elsom {
            self.contactUnwrapped.elsom = elsom
        }
        if let balance = self.contacts?.balanceKg {
            self.contactUnwrapped.balanceKg = balance
        }
        
        self.delegate?.didLoadAnimation()
    }
}
