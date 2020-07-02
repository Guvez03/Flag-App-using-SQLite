//
//  Bayraklar.swift
//  Flag App
//
//  Created by ahmet on 2.07.2020.
//  Copyright © 2020 ahmet. All rights reserved.
//

import Foundation

class Bayraklar:Equatable,Hashable{
    static func == (lhs: Bayraklar, rhs: Bayraklar) -> Bool {
        return lhs.bayrak_id == rhs.bayrak_id
    }
    var hashValue: Int {
           return bayrak_id.hashValue
       }
    
    var bayrak_id:Int?
    var bayrak_ad:String?
    var bayrak_resim:String?
    
    init() {
        
    }
    init(bayrak_id:Int,bayrak_ad:String,bayrak_resim:String) {
        
        self.bayrak_ad = bayrak_ad
        self.bayrak_id = bayrak_id
        self.bayrak_resim = bayrak_resim
    }
}
