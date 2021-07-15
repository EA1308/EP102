//
//  SavedCell.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import UIKit

class SavedCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    private var homeDataSource: HomeDataSource!
    
    var savedList: [SavedProduct]?
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        collectionViewLayout()
        configureDataSource()
    }
    

    func setupCollectionView() {
        collectionView.isScrollEnabled = false
        collectionView.registerNib(class: SavedItem.self)
    }
    

    private func collectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 40 , height: 107)
        layout.minimumLineSpacing = 20
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collectionView.collectionViewLayout = layout
    }
    
    func configureDataSource() {
        homeDataSource = HomeDataSource(with: collectionView)
        homeDataSource.fetchSavedItems()
    }
    
}

