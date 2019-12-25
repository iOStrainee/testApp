//
//  SliderViewModel.swift
//  bambook
//
//  Created by Admin on 13/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class SliderViewModel: NSObject,ResourceData {
    
   var typeCells: TypeCell = .normal
   weak var delegate: ViewModelDelegate?
    
    var sliderItems = [Slider]()
    var countRow: Int {
        return sliderItems.count
    }
    init(delegate:ViewModelDelegate? = nil) {
        super.init()
        self.delegate = delegate
        self.sliderQuery {[weak object = self] (temp) in
            if temp {
                print("success slider")
                object?.delegate?.didLoadAnimation()
            } else {
                print("fail slider")
                object?.delegate?.hasError()
            }
        }
    }
    
    //MARK: slider query
    func sliderQuery(completionHandler: @escaping completion) {
        delegate?.willLoadAnimation()
        Api.singleton.getSlider {[weak object = self] (tempSliderArray, tempError) in
            if tempError {
                guard let tempArray = tempSliderArray else {
                    print("Slider error after success query")
                    return
                }
                object?.sliderItems = tempArray
                completionHandler(true)
            } else {
                print("Slider has error in query")
                completionHandler(false)
            }
        }
    }
}
