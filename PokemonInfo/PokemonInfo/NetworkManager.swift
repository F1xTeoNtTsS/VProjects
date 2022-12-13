//
//  NetworkManager.swift
//  PokemonInfo
//
//  Created by F1xTeoNtTsS on 19.01.2022.
//

import UIKit

class NetworkManager {
    static let shared = NetworkManager()
    
    func fetchGenericsData<T: Decodable>(urlString: String, completion: @escaping(T?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                print("Fetching data failed with: \(error.localizedDescription)")
                completion(nil, error)
                return
            }
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(decodedData, nil)
                } catch let error {
                    print("Decoding failed with: \(error)")
                    completion(nil, error)
                }
            }
        }.resume()
    }
    
    
    func fetchPokemons(completion: @escaping (PokemonModel?, Error?) -> Void) {
        let urlString = "https://pokeapi.co/api/v2/pokemon"
        fetchGenericsData(urlString: urlString, completion: completion)
    }
    
    func fetchPokemonWith(url: String, completion: @escaping (CurrentPokemon?, Error?) -> Void) {
        let urlString = url
        fetchGenericsData(urlString: urlString, completion: completion)
    }
    
    func transformImage(url: String, completion: @escaping (UIImage?, Error?) -> Void){
        let urlString = url
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, resp, error in
            if let error = error {
                print("Fetching data failed with ", error.localizedDescription)
                completion(nil, error)
                return
            }
            
            if let data = data {
                let imageFromData = UIImage(data: data)
                completion(imageFromData, nil)
            }
        }.resume()
    }
}
