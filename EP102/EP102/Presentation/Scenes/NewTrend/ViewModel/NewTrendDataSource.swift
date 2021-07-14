//
//  NewTrendDataSource.swift
//  EbayApp
//
//  Created by MacBook  on 14.07.21.
//

import UIKit

class NewTrendDataSource: NSObject {
    private var collectionView: UICollectionView!
    private var viewModel: NewTrendViewModelProtocol!
    var productsList: [Product]?
    
    init(with collectionView: UICollectionView, viewModel: NewTrendViewModelProtocol) {
        super.init()
        self.collectionView = collectionView
        self.viewModel = viewModel
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        setupCollectionViewLayout()
        collectionView.registerNib(class: NewTrendItem.self)
    }
    
    func setupCollectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 30 , height: 160)
        layout.minimumLineSpacing = 20
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collectionView.collectionViewLayout = layout
        collectionView.backgroundColor = .clear
    }
    
    func refresh() {
        viewModel.fetchProducts { [weak self] products in
            self?.productsList = products
            self?.collectionView.reloadData()
        }
    }
    
    
}


extension NewTrendDataSource: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productsList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(NewTrendItem.self, for: indexPath)
        cell.configure(with: productsList?[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let product = productsList?[indexPath.row] else {return}
        viewModel.controller.coordinator?.proceedToDetails(with: product)
        
    }
}

