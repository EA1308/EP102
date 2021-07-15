//
//  ShoppingHabitsCell.swift
//  EP102
//
//  Created by MacBook  on 15.07.21.
//

import UIKit

class ShoppingHabitsCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private var homeDataSource: HomeDataSource!
    
    private var recentlyViewedList: [Product]?
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        collectionViewLayout()
        configureDataSource()

    }
    
    func setupCollectionView() {
        collectionView.isScrollEnabled = false
        collectionView.registerNib(class: ShoppingHabitsItem.self)
    }
    
    private func collectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 27.5 , height: 218)
        layout.minimumLineSpacing = 20
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 19)
        collectionView.collectionViewLayout = layout
    }

    
    func configureDataSource() {
        homeDataSource = HomeDataSource(with: collectionView)
        homeDataSource.fetchHabits()
        
    }
    
}


