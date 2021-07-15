//
//  ProductCell.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import UIKit

class ProductCell: UITableViewCell {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var homeDataSource: HomeDataSource!
//    private var categoryList: [Product]?
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.isScrollEnabled = false
        collectionView.registerNib(class: ProductItem.self)
        collectionViewLayout()
        configureDataSource()
    }
    
    private func collectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 27.5 , height: 200)
        layout.minimumLineSpacing = 20
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 19)
        collectionView.collectionViewLayout = layout
    }
    


    func configureDataSource() {
        homeDataSource = HomeDataSource(with: collectionView)
        homeDataSource.fetchCategories()
    }
    
    
}

