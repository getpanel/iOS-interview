//
//  GifImage.swift
//  iOS-interview
//
//  Created by Caleb Davis on 6/3/23.
//

import Foundation

struct GifImage: Hashable, Equatable, Identifiable {
    let id: String
    let url: URL
    let mp4: URL
    let height: Int
    let width: Int

    init?(id: String, url: String, mp4: String, height: Int, width: Int) {
        guard
            let imageURL = URL(string: url),
            let mp4URL = URL(string: mp4)
        else { return nil }

        self.id = id
        self.url = imageURL
        self.mp4 = mp4URL
        self.height = height
        self.width = width
    }

    init?(from response: Response.GiphyImage) {
        guard
            let height = Int(response.images.original.height),
            let width = Int(response.images.original.width)
        else { return nil}

        self.init(
            id: response.id,
            url: response.images.original.url,
            mp4: response.images.original.mp4,
            height: height,
            width: width
        )
    }
}
