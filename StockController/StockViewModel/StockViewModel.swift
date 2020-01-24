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
    private var item:[Stocks] = [Stocks]() {
        didSet {
            self.unwrappedData()
        }
    }
    var stockModel:[StockModel] = [] {
        didSet {
            delegate?.didLoadAnimation()
        }
    }
    
    var countRow: Int {
        return item.count
    }
    
    init(delegate:ViewModelDelegate? = nil) {
        self.delegate = delegate
        self.delegate?.willLoadAnimation()
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
    private func unwrappedData() {
        self.stockModel = self.item.map {
            var data = StockModel()
            
            if let id = $0.id {
                data.id = id
            }
            if let title = $0.title {
                data.title = title
            }
            if let subtitle = $0.subTitle {
                data.subTitle = subtitle
            }
            if let image = $0.image {
                data.image = image
            }
            if let descr = $0.description {
                data.description = descr
            }
            if let active = $0.is_active {
                data.is_active = active
            }
            if let end = $0.end_data {
                data.end_data = end
            }
            return data
        }
    }
}
