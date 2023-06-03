//
//  Response.swift
//  iOS-interview
//
//  Created by Caleb Davis on 6/3/23.
//

import Foundation

struct Response: Decodable {
    let data: [GiphyImage]

    struct GiphyImage: Decodable {
        let id: String
        let images: Image
    }

    struct Image: Decodable {
        let original: Original

        struct Original: Decodable {
            let height: String
            let width: String
            let url: String
            let mp4: String
        }
    }
}
