//
//  Cache.swift
//  Astronomy
//
//  Created by Iyin Raphael on 1/31/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class Cache<Key: Hashable, Value> {
    
    private var dictCacheImage: [Key : Value] = [:]
    
    
    func insert(value: Value, for key: Key){
        dictCacheImage[key] = value
    }
    
    func value(for key: Key) -> Value?{
       return dictCacheImage[key]
    }

}
