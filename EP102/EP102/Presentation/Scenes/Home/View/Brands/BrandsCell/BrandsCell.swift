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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.registerNib(class: BrandsItem.self)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isScrollEnabled = false
    }
    
    private func collectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 40 , height: 30)
//        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
//        collectionView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        collectionView.collectionViewLayout = layout
    }

    func configure(with items: [Brand]?) {
        self.brandList = items
        collectionView.reloadData()
    }

}

extension BrandsCell: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return brandList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.deque(BrandsItem.self, for: indexPath)
        cell.configure(with: brandList?[indexPath.row])
        return cell
    }
}

