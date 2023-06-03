//
//  GiphyCollectionView.swift
//  iOS-interview
//
//  Created by Caleb Davis on 6/3/23.
//

import UIKit

class GiphyCollectionView: UICollectionView {
    let cellId: String = String(describing: GiphyCollectionViewCell.self)

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        register(GiphyCollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        dataSource = self
        prefetchDataSource = self
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension GiphyCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: cellId,
            for: indexPath
        ) as? GiphyCollectionViewCell else { fatalError() }

        return cell
    }
}

extension GiphyCollectionView: UICollectionViewDataSourcePrefetching {
    func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {

    }

    func collectionView(_ collectionView: UICollectionView, cancelPrefetchingForItemsAt indexPaths: [IndexPath]) {

    }
}
