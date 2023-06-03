//
//  GiphyViewModel.swift
//  iOS-interview
//
//  Created by Caleb Davis on 6/3/23.
//

import Foundation

protocol GiphyViewModel {
    var currentPage: Int { get }
    var images: [GifImage] { get }
    var viewState: ViewState { get }

    func fetchImages(completion: @escaping Closure)
}

enum ViewState {
    case initial
    case loading
    case completed([GifImage])
    case error(NetworkingError)
}

class GiphyCollectionViewModel: GiphyViewModel {
    private let networkingSerivce: NetworkingService

    private(set) var currentPage: Int = 0
    private(set) var images: [GifImage] = []
    private(set) var viewState: ViewState = .initial

    init(networkingSerivce: NetworkingService) {
        self.networkingSerivce = networkingSerivce
    }

    func fetchImages(completion: @escaping Closure) {
        viewState = .loading
        networkingSerivce.fetchImages(page: currentPage) { [weak self] (result: NetworkingResponse) in
            guard let self else { return }
            switch result {
            case let .success(response):
                self.images += response.data.compactMap(GifImage.init)
                self.viewState = .completed(self.images)
                self.currentPage += 1
            case let .failure(error):
                self.viewState = .error(error)
            }

            completion()
        }
    }
}
