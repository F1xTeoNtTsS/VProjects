//
//  NetworkManager.swift
//  NetworkingTest
//
//  Created by F1xTeoNtTsS on 26.10.2021.
//

import UIKit

class NetworkManager {
    
    static func getRequestPressed(url:String){
        guard let url = URL(string: url) else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            guard let response = response,
            let data = data else { return }
            print(response)
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    static func postRequestPressed(url:String){
        guard let url = URL(string: url) else { return }
        let usersData = ["Course": "Networking", "Lesson":"Get and POST requests"]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        guard let httpBody = try? JSONSerialization.data(withJSONObject: usersData, options: []) else { return }
        request.httpBody = httpBody
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        session.dataTask(with: request) { data, response, error in
            guard let response = response, let data = data else { return }
            print(response)
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    static func downLoadImage(url:String, completion: @escaping (_ image: UIImage)->()){
        guard let url = URL(string: url) else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { data, response, error in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image)
                }
            }
        }.resume()
    }
    
    static func fetchData(url: String, completion: @escaping (_ courses: [CourseModel])->()){
        guard let url = URL(string: url) else { return }
        let session = URLSession.shared
        session.dataTask(with: url) { data, _, _ in
            guard let data = data else { return }
            do {
                let courses = try JSONDecoder().decode([CourseModel].self, from: data)
                completion(courses)
            } catch let error {
                print("Failed with: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    
    static func uploadImage(url:String){
        let image = UIImage(named: "rockLi")!
        let httpHeaders = ["Authorization": "Client-ID 1ff532ef678f45d"]
        guard let imageProperties = ImageProperties(withImage: image, forKey: "image") else { return }
        
        guard let url = URL(string: url) else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = httpHeaders
        request.httpBody = imageProperties.data
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }
}
