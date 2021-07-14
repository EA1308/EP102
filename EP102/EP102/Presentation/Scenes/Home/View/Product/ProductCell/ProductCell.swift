//
//  ProductCell.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import UIKit

class ProductCell: UITableViewCell {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var categoryList: [Product]?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        collectionView.isScrollEnabled = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerNib(class: ProductItem.self)
        collectionViewLayout()
    }
    
    private func collectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 27.5 , height: 200)
        layout.minimumLineSpacing = 20
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 19)
        collectionView.collectionViewLayout = layout
    }
    
    
    func configure(with items: [Product]) {
        self.categoryList = items
        self.collectionView.reloadData()
        
    }
    
}

extension ProductCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(ProductItem.self, for: indexPath)
        cell.configure(with: categoryList?[indexPath.row])
        return cell
    }
    
}
