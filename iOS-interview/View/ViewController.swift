//
//  ViewController.swift
//  iOS-interview
//
//  Created by Caleb Davis on 4/4/23.
//

import UIKit

class ViewController: UIViewController {

    private let viewModel: GiphyViewModel

    private lazy var collectionViewLayout: UICollectionViewFlowLayout = {
        let layout: UICollectionViewFlowLayout = .init()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 5
        let width: CGFloat = (view.frame.width / 2.0) - 5
        layout.itemSize = CGSize(width: width, height: 200)
        return layout
    }()

    private lazy var collectionView: GiphyCollectionView = .init(
        frame: .zero,
        collectionViewLayout: collectionViewLayout
    )

    init(viewModel: GiphyViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(collectionView)
        collectionView.fill()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewModel.fetchImages { [weak self] in
            // update view state
            self?.reload()
        }
    }

    private func reload() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}
