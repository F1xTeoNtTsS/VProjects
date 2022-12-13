//
//  LoadingService.swift
//  tttttt
//
//  Created by F1xTeoNtTsS on 03.02.2022.
//

import Foundation

protocol LoadingServiceProtocol {
    func loadImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void)
}

class LoadingService: LoadingServiceProtocol {
    
    func loadImage(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> Void) {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        config.urlCache = nil
        
        let urlSession = URLSession.init(configuration: config)
        urlSession.dataTask(with: url, completionHandler: completion).resume()
    }
}
