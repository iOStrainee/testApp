//
//  Delegate and Another Protocols.swift
//  bambook
//
//  Created by Admin on 14/10/2019.
//  Copyright © 2019 Admin. All rights reserved.
//

import Foundation
typealias hasError = ()->Void

enum TypeCell {
    case freeGarnish
    case isNew
    case himeraFreeIsNew
    case normal
}

enum typeStocks {
    case moreInformation
    case shortInformation
}

protocol ViewModelDelegate:class {
    func willLoadAnimation()->Void
    func didLoadAnimation()->Void
    func hasError()->Void
}

// MARK: -  here we definition optional methods
extension ViewModelDelegate {
    // here we make a data transfer
    func dataTransfer<Template:ViewModelDelegate>(conformViewModelDelegate:Template)->Void {
    }
}

protocol ResourceData:class {
    var countRow:Int{get}
    var delegate:ViewModelDelegate? {get set}
}

extension ResourceData {
    var countRow:Int {
        return 1
    }
    
    var stockType:typeStocks{
        return .shortInformation
    }
    
    //optional functions
    func bootModel(){}
}

//MARK: - Data protocol for for unwrapped data
protocol DataMappable {
    var id:Int {get set}
    var type:TypeCell{get}
}
extension DataMappable {
    var type:TypeCell {
        return .normal
    }
}
