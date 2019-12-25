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
                
                object?.settingTypeCell()
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
    
    //MARK: - setting typecell
    private func settingTypeCell() {
        if let temp = self.items?.dishes {
            
            self.items?.dishes = temp.map {
                var t = $0
                if $0.with_garnish {
                    t.typeCell = .freeGarnish
                }
                if $0.isNew {
                    t.typeCell = .isNew
                }
                
                if $0.with_garnish && $0.isNew {
                    t.typeCell = .himeraFreeIsNew
                }
                return t
            }
        }
        delegate?.didLoadAnimation()
    }
}
