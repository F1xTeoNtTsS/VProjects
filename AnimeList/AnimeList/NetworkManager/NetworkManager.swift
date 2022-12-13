//
//  NetworkManager.swift
//  AnimeList
//
//  Created by F1xTeoNtTsS on 31.01.2022.
//

import Foundation
import UIKit

//enum NetworkDataType {
//    case animeList
//    case currentAnimeInfo
//}

protocol NetworkManagerProtocol {
    func fetchData(completion: @escaping (Result<DataModel, Error>) -> Void)
}
class NetworkManager: NetworkManagerProtocol {
    
    
    func fetchData(completion: @escaping (Result<DataModel, Error>) -> Void) {
        let url = "https://kitsu.io/api/edge/trending/anime"
        fetchGenericData(urlString: url, completion: completion)
    }
    
    private func fetchGenericData<T: Decodable>(urlString: String,
                                                completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch let error {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
