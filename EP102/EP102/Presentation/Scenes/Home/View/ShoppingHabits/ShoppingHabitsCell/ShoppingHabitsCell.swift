//
//  ShoppingHabitsCell.swift
//  EP102
//
//  Created by MacBook  on 15.07.21.
//

import UIKit

class ShoppingHabitsCell: UITableViewCell {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var recentlyViewedList: [Product]?
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        collectionViewLayout()
        
    }
    
    func setupCollectionView() {
        collectionView.isScrollEnabled = false
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.registerNib(class: RecentlyViewedItem.self)
    }
    
    private func collectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 2 - 27.5 , height: 218)
        layout.minimumLineSpacing = 20
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 19)
        collectionView.collectionViewLayout = layout
    }
    
    func configure(with items: [Product]?) {
        self.recentlyViewedList = items
        self.collectionView.reloadData()
    }
    
}


extension ShoppingHabitsCell: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return recentlyViewedList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(RecentlyViewedItem.self, for: indexPath)
        cell.configure(with: recentlyViewedList?[indexPath.row])
        return cell
    }
    
}
