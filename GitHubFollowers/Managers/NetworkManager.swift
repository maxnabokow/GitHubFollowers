//
//  NetworkManager.swift
//  GitHubFollowers
//
//  Created by Max Nabokow on 1/4/20.
//  Copyright © 2020 Maximilian Nabokow. All rights reserved.
//

import Foundation

class NetworkManager {
   static let shared = NetworkManager()
    let baseUrl = "https://api.github.com/users/"
    
    private init() {}
    
    func getFollowers(for username: String, pageNr: Int, completion: @escaping ([Follower]?, ErrorMessage?) -> Void) {
        let endpoint = baseUrl + "\(username)/followers?per_page=100&page=\(pageNr)"
        
        guard let url = URL(string: endpoint) else {
            completion(nil, .invalidUsername)
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completion(nil, .unableToComplete)
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(nil, .invalidResponse)
                return
            }
            
            guard let data = data else {
                completion(nil, .invalidData)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let followers = try decoder.decode([Follower].self, from: data)
                completion(followers, nil)
            } catch {
                completion(nil, .invalidData)
            }
        }.resume()
    }
}
