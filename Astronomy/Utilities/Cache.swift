//
//  Cache.swift
//  Astronomy
//
//  Created by Iyin Raphael on 1/31/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

class Cache<Key: Hashable, Value> {
    
    let queue = DispatchQueue.init(label: "cache")
    private var dictCacheImage: [Key : Value] = [:]
    
    func insert(value: Value, for key: Key){
        queue.async {
            self.dictCacheImage[key] = value
        }
    }
    
    func value(for key: Key) -> Value? {
    //Note that DispatchQueue.sync()'s closure can return a value which will subsequently be returned from DispatchQueue.sync() itself.
        return queue.sync { dictCacheImage[key]}
    }
}
