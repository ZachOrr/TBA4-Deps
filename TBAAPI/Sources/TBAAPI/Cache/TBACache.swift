//
//  TBACache.swift
//
//
//  Created by Zachary Orr on 1/7/24.
//

import Foundation

class TBACache: CacheStore {

    let cache: NSCache<NSString, NSData> = NSCache()

    public func get(for url: URL) -> CachedResponse? {
        guard let encodedResponse = cache.object(forKey: NSString(string: url.absoluteString)) else {
            return nil
        }
        return try? decode(Data(referencing: encodedResponse))
    }

    public func set(_ response: CachedResponse, for url: URL) {
        guard let encodedResponse = try? encode(response) else {
            return
        }
        cache.setObject(NSData(data: encodedResponse), forKey: NSString(string: url.absoluteString))
    }

    public func clear() {
        cache.removeAllObjects()
    }

}

extension TBACache {

    func encode(_ response: CachedResponse) throws -> Data {
        let encoder = PropertyListEncoder()
        return try encoder.encode(response)
    }

    func decode(_ data: Data) throws -> CachedResponse {
        let decoder = PropertyListDecoder()
        return try decoder.decode(CachedResponse.self, from: data)
    }

}
