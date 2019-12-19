//
//  MainCategoryMenuViewModel.swift
//  bambook
//
//  Created by Admin on 10/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class MainCategoryMenuViewModel: NSObject ,ResourceData{
    var typeCells: TypeCell?
    
    weak var delegate: ViewModelDelegate?
    var dataItems = [CategoryDishes]()
    
    var countRow: Int {
        return dataItems.count
    }
    
    init(delegate:ViewModelDelegate? = nil) {
        self.delegate = delegate
        super.init()
        self.preLoadData {[weak object = self] (temp) in
            if temp {
                object?.delegate?.didLoadAnimation()
            } else {
                object?.delegate?.hasError()
            }
        }
    }
    
//MARK: preload data for menu category collection view
    func preLoadData(completionHandler: @escaping completion){
        delegate?.willLoadAnimation()
        Api.singleton.categoriesMenu {[weak object = self ] (tempCategoryArray, tempError) in
            if tempError {
                guard let tempArray = tempCategoryArray else {
                    print("Category with error before data retrieve")
                    completionHandler(false)
                    return
                }
                object?.dataItems = tempArray
                completionHandler(true)
            } else {
                print("Category has error in query")
                completionHandler(false)
            }
        }
    }
}
