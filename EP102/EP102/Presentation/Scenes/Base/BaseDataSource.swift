//
//  BaseDataSource.swift
//  EP102
//
//  Created by MacBook  on 15.07.21.
//

import UIKit

class BaseDataSource: NSObject {
    
    
    var singleSectionModels: [CellItem]!
    var multiSectionModels: [[CellItem]]!
    
    var singleCollectionViewSectionModels: [CellItem]!
    var multipleCollectionViewSectionModels: [[CellItem]]!
    
    weak var tableView: UITableView? {
        didSet {
            tableView?.dataSource = self
        }
    }
    
    weak var collectionView: UICollectionView? {
        didSet{
            collectionView?.dataSource = self
        }
    }
    
    
    func refresh() {
        
    }
    
    func initCustomCell(for indexPath: IndexPath, with cellIdentifier: String) -> UITableViewCell? {
        return nil
    }
    
    func initCustomCollectionViewCell(for indexPath: IndexPath, with cellIdentifier: String) -> UICollectionViewCell? {
        return nil
    }
}

extension BaseDataSource: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if singleSectionModels != nil {
            return 1
        } else if multiSectionModels != nil {
            return multiSectionModels.count
        } else {
            fatalError("No models set up!")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items(for: section).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellViewModel = items(for: indexPath.section)[indexPath.row]
        let cell: UITableViewCell
        
        switch cellViewModel.cellIdentifier {
        case WideCell.identifier:
            cell = tableView.deque(WideCell.self, for: indexPath)
        case ProductCell.identifier:
            cell = tableView.deque(ProductCell.self, for: indexPath)
        case RecentlyViewedCell.identifier:
            cell = tableView.deque(RecentlyViewedCell.self, for: indexPath)
        case SavedCell.identifier:
            cell = tableView.deque(SavedCell.self, for: indexPath)
        case BrandsCell.identifier:
            cell = tableView.deque(BrandsCell.self, for: indexPath)
        case ShoppingHabitsCell.identifier:
            cell = tableView.deque(ShoppingHabitsCell.self, for: indexPath)
        default:
            if let _cell = initCustomCell(for: indexPath, with: cellViewModel.cellIdentifier) {
                cell = _cell
            } else {
                fatalError()
            }
        }
        
        if let configurableCell = cell as? CellConfigurable {
            configurableCell.configure(with: cellViewModel)
        }
        
        return cell
    }
    
    func items(for section: Int) -> [CellItem] {
        if singleSectionModels != nil {
            return singleSectionModels
        } else if multiSectionModels != nil {
            return multiSectionModels[section]
        } else {
            fatalError("No models set up!")
        }
    }
}

extension BaseDataSource: UICollectionViewDataSource {
    
    func numberOfSections(in tableView: UICollectionView) -> Int {
        if singleCollectionViewSectionModels != nil {
            return 1
        } else if multipleCollectionViewSectionModels != nil {
            return multipleCollectionViewSectionModels.count
        } else {
            fatalError("No models set up!")
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsInSection(for: section).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellViewModel = itemsInSection(for: indexPath.section)[indexPath.row]
        let cell: UICollectionViewCell
        
        switch cellViewModel.cellIdentifier {
        case ProductItem.identifier:
            cell = collectionView.deque(ProductItem.self, for: indexPath)
        case RecentlyViewedItem.identifier:
            cell = collectionView.deque(RecentlyViewedItem.self, for: indexPath)
        case SavedItem.identifier:
            cell = collectionView.deque(SavedItem.self, for: indexPath)
        case BrandsItem.identifier:
            cell = collectionView.deque(BrandsItem.self, for: indexPath)
        case ShoppingHabitsItem.identifier:
            cell = collectionView.deque(ShoppingHabitsItem.self, for: indexPath)
        default:
            if let _cell = initCustomCollectionViewCell(for: indexPath, with: cellViewModel.cellIdentifier) {
                cell = _cell
            } else {
                fatalError()
            }
        }
        if let configurableCell = cell as? CollectionViewCellConfigurable {
            configurableCell.configure(with: cellViewModel)
        }
        
        return cell
    }
    
    
    func itemsInSection(for section: Int) -> [CellItem] {
        if singleCollectionViewSectionModels != nil {
            return singleCollectionViewSectionModels
        } else if multipleCollectionViewSectionModels != nil {
            return multipleCollectionViewSectionModels[section]
        } else {
            fatalError("No models set up!")
        }
    }
}



protocol CellConfigurable: UITableViewCell {
    func configure(with item: CellItem)
}

protocol CollectionViewCellConfigurable: UICollectionViewCell {
    func configure(with item: CellItem)
}

protocol CellItem {
    var cellIdentifier: String { get }
}

struct CellViewModel: CellItem {
    
    private(set) var cellIdentifier: String
    
    let userData: [CellViewModelUserDataKey: Any]
    
    init(cellIdentifier: String,
         userData: [CellViewModelUserDataKey: Any]? = nil) {
        self.cellIdentifier = cellIdentifier
        self.userData = userData ?? [:]
    }
}

enum CellViewModelUserDataKey {
    case data
}
