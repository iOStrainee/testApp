//
//  DishesCategoryViewModel.swift
//  bambook
//
//  Created by Admin on 21/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class DishesCategoryViewModel: NSObject , ResourceData{
   weak var delegate: ViewModelDelegate?
    
    var typeCells: TypeCell?
    
    var items:DishesFromCategory?
    
    var countRow: Int {
        guard let count = items?.dishes?.count else {return 0}
        return count > 0 ? count : 0
    }
    
    init(idCategory:Int,delegateObject:ViewModelDelegate? = nil) {
        self.delegate = delegateObject
        super.init()
        self.preloadData(id: idCategory) {[weak object = self] (temp) in
            if temp {
                object?.delegate?.didLoadAnimation()
            } else {
                object?.delegate?.hasError()
            }
        }
    }
    
    private func preloadData(id:Int,completionHandler: @escaping completion) {
        delegate?.willLoadAnimation()
        Api.singleton.getDishesFromGategories(fromCategories: id) {[weak object = self] (data, flag) in
            if flag {
                guard let tempData = data else {
                    print("error retrieve data dishesCategoryViewModel")
                   completionHandler(false)
                    return
                }
                object?.items = tempData
                completionHandler(true)
            } else {
                print("error query dishesCategoryViewModel")
                completionHandler(false)
            }
        }
    }
}
