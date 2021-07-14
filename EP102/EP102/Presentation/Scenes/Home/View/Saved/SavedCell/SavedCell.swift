//
//  SavedCell.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import UIKit

class SavedCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var savedList: [SavedProduct]?
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()

        collectionViewLayout()
    }
    

    func setupCollectionView() {
        collectionView.isScrollEnabled = false
        collectionView.dataSource = self
        collectionView.delegate = self
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
    
    func configure(with items: [SavedProduct]?) {
        self.savedList = items
        self.collectionView.reloadData()
        
    }
    
}


extension SavedCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return savedList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(SavedItem.self, for: indexPath)
        cell.configure(with: savedList?[indexPath.row])
        return cell
    }
    
    
}
