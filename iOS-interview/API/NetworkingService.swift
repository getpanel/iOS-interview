//
//  NetworkingService.swift
//  iOS-interview
//
//  Created by Caleb Davis on 4/4/23.
//

import Foundation

protocol NetworkingService {
    /// Fetches Giphy images from local JSON files
    ///
    /// For the sake of time, we are providing a static networking service that stubs the giphy API.
    /// You can find the JSON files in the Resources directory.  We have a max of 100 images available,
    /// and if you finish the code challenge you could consider writing an actual networking layer
    /// integrating with Giphy's API.
    ///
    /// - Parameters:
    ///     - page: The page index for pagination.  We have giphy_1, ... , giphy_5.
    ///     - completion: Swift.Result closure that provides the Decodable data model that you will create for the response or the NetworkingError.
    func fetchImages<T: Decodable>(page: Int, completion: @escaping NetworkingCompletion<T>)
}

final class NetworkingServiceImp: NetworkingService {

    func fetchImages<T: Decodable>(page: Int, completion: @escaping NetworkingCompletion<T>) {
        guard (1..<5).contains(page) else {
            return completion(.failure( NetworkingError.invalidOffset))
        }
        
        guard let path: String = Bundle.main.path(forResource: "giphy_\(page + 1)", ofType: "json") else {
            return completion(.failure(NetworkingError.invalidOffset))
        }

        let url: URL = .init(fileURLWithPath: path)

        do {
            let data: Data = try .init(contentsOf: url)

            guard let response = try? JSONDecoder().decode(T.self, from: data) else {
                return completion(.failure(NetworkingError.jsonDecoding))
            }

            completion(.success(response))
        } catch {
            completion(.failure(NetworkingError.invalidJSONFormat))
        }
    }
}
