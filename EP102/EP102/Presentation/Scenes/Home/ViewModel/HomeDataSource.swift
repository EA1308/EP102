//
//  HomeDataSource.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import UIKit


final class HomeDataSource: BaseDataSource, UITableViewDelegate {
    
    private static var viewModel: HomeViewModelProtocol!

    init(with tableView: UITableView, viewModel: HomeViewModelProtocol) {
        super.init()
        self.tableView = tableView
        HomeDataSource.viewModel = viewModel
        self.tableView?.delegate = self
        multiSectionModels = []
    }
    
    init (with collectionView: UICollectionView) {
        super.init()
        self.collectionView = collectionView
        singleCollectionViewSectionModels = []
    }

    func fetchCategories() {
        HomeDataSource.viewModel.fetchProducts { [unowned self] productList in
            for product in productList {
                self.singleCollectionViewSectionModels.append(self.productItem(data: product))
            }
            self.collectionView?.reloadData()

        }
    }
    
    func fetchRecentlyItems() {
        HomeDataSource.viewModel.fetchRecentlyViewed { [unowned self] recentlyList in
            for recently in recentlyList {
                self.singleCollectionViewSectionModels.append(self.recentlyViewedItem(data: recently))
            }
            self.collectionView?.reloadData()
        }
    }
     
    func fetchSavedItems() {
        HomeDataSource.viewModel.fetchSaved { [unowned self] savedItems in
            for savedItem in savedItems {
                self.singleCollectionViewSectionModels.append(self.savedItem(data: savedItem))
            }
            self.collectionView?.reloadData()

        }
    }
    
    func fetchBrands() {
        HomeDataSource.viewModel.fetchBrands { [unowned self] brands in
            for brand in brands {
                self.singleCollectionViewSectionModels.append(self.brandsItem(data: brand))
            }
            self.collectionView?.reloadData()
        }
    }
    
    func fetchHabits() {
        HomeDataSource.viewModel.fetchRecentlyViewed { [unowned self] habitsList in
            for habit in habitsList {
                self.singleCollectionViewSectionModels.append(self.shoppingHabitsItem(data: habit))
            }
            self.collectionView?.reloadData()
        }
    }
    
    

    
    override func refresh() {
        
      
        let wideCellData1 = WideCellData(title: "New Trend", image: "img_newTrend")
        let wideCellData2 = WideCellData(title: "Strippes", image: "img_stripples")
        let wideCellData3 = WideCellData(title: "Summer Sea", image: "img_summerSea")

        
        multiSectionModels = [[], [], [], [], [], [], [], []]
        multiSectionModels[0].append(wideCell(data: wideCellData1))
        
        multiSectionModels[1].append(productCell)
        
        multiSectionModels[2].append(wideCell(data: wideCellData2))
        multiSectionModels[3].append(wideCell(data: wideCellData3))
        
        multiSectionModels[4].append(recentlyViewed)
        multiSectionModels[5].append(savedCell)
        multiSectionModels[6].append(brandsCell)
        multiSectionModels[7].append(shoppingHabitsCell)
        
        tableView?.reloadData()

    }
}

private extension HomeDataSource {
    private func wideCell(data: WideCellData) -> CellViewModel {
        return CellViewModel(cellIdentifier: WideCell.identifier, userData: [.data: data])
    }
    private var productCell: CellViewModel {
        return CellViewModel(cellIdentifier: ProductCell.identifier)
    }
    private var recentlyViewed: CellViewModel {
        return CellViewModel(cellIdentifier: RecentlyViewedCell.identifier)
    }
    
    private var savedCell: CellViewModel {
        return CellViewModel(cellIdentifier: SavedCell.identifier)
    }
    private var brandsCell: CellViewModel {
        return CellViewModel(cellIdentifier: BrandsCell.identifier)
    }
    private var shoppingHabitsCell: CellViewModel {
        return CellViewModel(cellIdentifier: ShoppingHabitsCell.identifier)
    }
}

private extension HomeDataSource {
    private func productItem(data: Product) -> CellViewModel {
        return CellViewModel(cellIdentifier: ProductItem.identifier, userData: [.data: data])
    }
    private func recentlyViewedItem(data: Product) -> CellViewModel {
        return CellViewModel(cellIdentifier: RecentlyViewedItem.identifier, userData: [.data: data])
    }
    private func savedItem(data: SavedProduct) -> CellViewModel {
        return CellViewModel(cellIdentifier: SavedItem.identifier, userData: [.data: data])
    }
    private func brandsItem(data: Brand) -> CellViewModel {
        return CellViewModel(cellIdentifier: BrandsItem.identifier, userData: [.data: data])
    }
    private func shoppingHabitsItem(data: Product) -> CellViewModel {
        return CellViewModel(cellIdentifier: ShoppingHabitsItem.identifier, userData: [.data: data])
    }
}
