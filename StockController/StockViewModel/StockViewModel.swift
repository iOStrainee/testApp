//
//  StockViewModel.swift
//  bambook
//
//  Created by Admin on 18/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class StockViewModel: NSObject,ResourceData {
    
    weak var delegate: ViewModelDelegate?
    var item:[Stocks] = [Stocks]()
    
    var countRow: Int {
        return item.count
    }
    
    init(delegate:ViewModelDelegate? = nil) {
        self.delegate = delegate
        super.init()
        self.preloadData {[weak object = self] (flag) in
            if flag {
                object?.delegate?.didLoadAnimation()
            } else {
                object?.delegate?.hasError()
            }
        }
    }
    
    func preloadData(completionHandler: @escaping completion)->Void {
        delegate?.willLoadAnimation()
        Api.singleton.getStocks {[weak object = self] (dataStock, flag) in
            if flag {
                guard let data = dataStock else {
                    print("success query but error data retrieve")
                    completionHandler(false)
                    return
                }
                object?.item = data
                completionHandler(true)
            } else {
                print("fail query")
                completionHandler(false)
            }
        }
    }
}
