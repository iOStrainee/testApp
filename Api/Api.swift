//
//  Api.swift
//  bambook
//
//  Created by Admin on 03.10.2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

//MARK: - completion handler
typealias completion = (_ statusResponse:Bool)->Void

//MARK: - base url
let baseUrl = "http://51.255.13.22/api/v1/"
let errorDescription = "error url percent encoded "

class Api: NSObject {
    static let singleton = Api()
    
    // MARK: - check internet connection
    func checkConnection () {
        
    }
    
    //MARK: - get category menu
    func categoriesMenu(callback:@escaping (_ item:[CategoryDishes]?,_ error:Bool)->Void) {
        let url = "\(baseUrl)categories/"
        guard let encodedUrl = url.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else {
            print(errorDescription+"categories menu")
            callback(nil,false)
            return
        }
        Alamofire.request(encodedUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseArray { (response: DataResponse<[CategoryDishes]>) in
            switch response.result{
            case .success(let value):
                callback(value,true)
            case .failure(_):
                callback(nil,false)
            }
        }
    }
    
    //MARK: - get dishes from category by id
    func getDishesFromGategories(fromCategories id:Int?,callback: @escaping(_ item:DishesFromCategory?,_ error:Bool)->Void) {
        guard let tempId = id else {
            print("id is empty for dishes")
            callback(nil,false)
            return
        }
        guard let urlEncoded = ("\(baseUrl)categories/\(tempId)/").addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else {
            print(errorDescription+"dishes from category")
            callback(nil,false)
            return
        }
        Alamofire.request(urlEncoded, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseObject { (response:DataResponse<DishesFromCategory>) in
            switch response.result {
            case .success(let value):
                
                callback(value,true)
            case .failure(_):
                callback(nil,false)
            }
        }
    }
    
    //MARK: - get contacts
    func getContacts(callBack: @escaping(_ item:Contacts?,_ error:Bool)->Void){
        guard let urlEncoded = "\(baseUrl)contacts".addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else {
            print(errorDescription+"contacts")
            callBack(nil,false)
            return
        }
        Alamofire.request(urlEncoded, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseObject { (response: DataResponse<Contacts>) in
            switch response.result {
            case .success(let value):
                callBack(value,true)
            case .failure(_):
                callBack(nil,false)
            }
        }
    }
    
    //MARK: - get slider
    func getSlider(callback:@escaping(_ item:[Slider]?,_ error:Bool)->Void){
        guard let urlEncoded = "\(baseUrl)sliders".addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else {
            print(errorDescription+"sliders")
            callback(nil,false)
            return
        }
        Alamofire.request(urlEncoded, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseArray { (response: DataResponse<[Slider]>) in
            switch response.result {
            case .success(let value):
                callback(value,true)
            case .failure( _):
                callback(nil,false)
            }
        }
    }
    
    //MARK: - get stocks
    func getStocks(callback: @escaping (_ item:[Stocks]?,_ Error:Bool)->Void) {
        
        guard let urlEncoded = "\(baseUrl)stocks".addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else {
            print(errorDescription+"stocks")
            callback(nil,false)
            return
        }
        Alamofire.request(urlEncoded, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseArray { (response: DataResponse<[Stocks]>) in
            switch response.result {
            case .success(let value):
                callback(value,true)
            case .failure(_):
                callback(nil,false)
            }
        }
    }
}



//public func getSearchDishes(_ categoryId: Int, search: String, success: @escaping(_ items: [Dish]?, String?) -> Void) {
//    var url = String(format: "\(BASE_URL)/api/v1/dishes/?search=\(search.lowercased())")
//
//    if categoryId == 0{
//        url = String(format: "\(BASE_URL)/api/v1/dishes/?search=\(search.lowercased())")
//    }else{
//        url = String(format: "\(BASE_URL)/api/v1/dishes/?category=\(categoryId)&search=\(search.lowercased())")
//}
