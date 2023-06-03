//
//  GiphyCollectionViewCell.swift
//  iOS-interview
//
//  Created by Caleb Davis on 6/3/23.
//

import UIKit

class GiphyCollectionViewCell: UICollectionViewCell {

    private let imageView: UIImageView = .init(frame: .zero)

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
        contentView.addSubview(imageView)
        imageView.fill()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        imageView.image = nil
    }

    // TODO: - Download image from URL
    func setImage(url: URL) {

    }
}
