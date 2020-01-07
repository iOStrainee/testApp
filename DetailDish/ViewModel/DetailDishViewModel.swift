//
//  DetailDishViewModel.swift
//  bambook
//
//  Created by Admin on 29/12/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class DetailDishViewModel: NSObject,ResourceData {
    var delegate: ViewModelDelegate?
    
    init(delegate:ViewModelDelegate) {
        super.init()
        self.delegate = delegate
    }
    
    func loadData(completionHandled:@escaping completion)->Void {
        self.delegate?.willLoadAnimation()
        DispatchQueue.main.async { [weak object = self] in
            object?.delegate?.didLoadAnimation()
        }
    }
}
