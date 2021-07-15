//
//  BrandsCell.swift
//  EP102
//
//  Created by MacBook  on 14.07.21.
//

import UIKit

class BrandsCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var brandList: [Brand]?
    private var homeDataSource: HomeDataSource!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.registerNib(class: BrandsItem.self)
        collectionView.isScrollEnabled = false
        configureDataSource()

    }
    
    private func collectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 50
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collectionView.collectionViewLayout = layout
    }

        func configureDataSource() {
            homeDataSource = HomeDataSource(with: collectionView)
            
            homeDataSource.fetchBrands()
        }
    
    

}
