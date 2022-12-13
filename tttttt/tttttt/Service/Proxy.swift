//
//  Proxy.swift
//  tttttt
//
//  Created by F1xTeoNtTsS on 03.02.2022.
//

import Foundation

var cache: Data?

class Proxy: LoadingServiceProtocol {

    var service: LoadingServiceProtocol
    init(service: LoadingServiceProtocol) {
        self.service = service
    }
    
    func loadImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        if let cache = cache {
            completion(cache, nil, nil)
        } else {
            service.loadImage(url: url) { data, responce, error in
                    cache = data
                completion(data, responce, error)
            }
        }
    }
}
