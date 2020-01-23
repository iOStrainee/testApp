//
//  MainCategoryMenuViewModel.swift
//  bambook
//
//  Created by Admin on 10/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class MainCategoryMenuViewModel: NSObject ,ResourceData{
    
    weak var delegate: ViewModelDelegate?
    
    private var dataItemsOptional = [CategoryDishes]() {
        didSet {
            self.unwrappedData()
        }
    }
    var dataItems:[CategoryDishModel] = [] {
        didSet {
            delegate?.didLoadAnimation()
        }
    }
    
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
                object?.dataItemsOptional = tempArray
                completionHandler(true)
            } else {
                print("Category has error in query")
                completionHandler(false)
            }
        }
    }
    
    //MARK: data with already unwrapped
    private func unwrappedData() {
       self.dataItems  =  self.dataItemsOptional.map {
            var dishCategory = CategoryDishModel()
            
            if let id = $0.id {
                dishCategory.id = id
            }
            if let name = $0.name {
                dishCategory.name = name
            }
            if let slug = $0.slug {
                dishCategory.slug = slug
            }
            if let image = $0.image {
                dishCategory.image = image
            }
        return dishCategory
        }
    }
}
