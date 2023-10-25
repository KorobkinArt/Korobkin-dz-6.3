//
//  NetworkManager.swift
//  Korobkin dz 6.3
//
//  Created by Артем Коробкин on 24/10/23.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    func addressRequest(address: String, completion: @escaping (Result<Welcome, Error>) -> Void) {
        let apiKey = "5e8ef26a7d652f29636a9ea8312242d5"
        guard let urlString = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(address)&units=metric&lang=ru&appid=\(apiKey)") else {
            print("url nil")
            return
        }
        print(urlString)
        let request = URLRequest(url: urlString)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            print("success")
            guard let data = data else {return}
            do {
                let content = try JSONDecoder().decode(Welcome.self, from: data)
                print(data)
                completion(.success(content))
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}

