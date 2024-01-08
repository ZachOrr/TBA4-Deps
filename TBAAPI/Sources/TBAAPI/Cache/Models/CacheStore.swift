//
//  CacheStore.swift
//  
//
//  Created by Zachary Orr on 6/10/21.
//

import Foundation

public protocol CacheStore {
    func get(for url: URL) -> CachedResponse?
    func set(_ value: CachedResponse, for url: URL)
    func clear()
}
