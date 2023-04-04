//
//  NetworkingError.swift
//  iOS-interview
//
//  Created by Caleb Davis on 4/4/23.
//

import Foundation

enum NetworkingError: Error {
    case invalidOffset
    case invalidJSONFormat
    case jsonDecoding

    var message: String {
        switch self {
        case .invalidOffset:
            return "⛔️ Could not load JSON file from Bundle, try a different offset value."
        case .invalidJSONFormat:
            return "⛔️ Failed to initialize the data and serialize the JSON from the API."
        case .jsonDecoding:
            return "⛔️ JSON decoding failed, check your data models."
        }
    }
}
