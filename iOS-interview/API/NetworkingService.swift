//
//  NetworkingService.swift
//  iOS-interview
//
//  Created by Caleb Davis on 4/4/23.
//

import Foundation

protocol NetworkingService {
    func fetchImages<T: Decodable>(offset: Int, NetworkingCompletion: @escaping NetworkingCompletion<T>)
}

final class NetworkingServiceImp: NetworkingService {

    func fetchImages<T: Decodable>(offset: Int, NetworkingCompletion: @escaping NetworkingCompletion<T>) {
        guard (1...5).contains(offset) else {
            return NetworkingCompletion(.failure( NetworkingError.invalidOffset))
        }
        
        guard let path: String = Bundle.main.path(forResource: "giphy_\(offset)", ofType: "json") else {
            return  NetworkingCompletion(.failure(NetworkingError.invalidOffset))
        }

        let url: URL = .init(fileURLWithPath: path)

        do {
            let data: Data = try .init(contentsOf: url)

            guard let response = try? JSONDecoder().decode(T.self, from: data) else {
                return NetworkingCompletion(.failure(NetworkingError.jsonDecoding))
            }

            NetworkingCompletion(.success(response))
        } catch {
            NetworkingCompletion(.failure(NetworkingError.invalidJSONFormat))
        }
    }
}
