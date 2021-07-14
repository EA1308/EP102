//
//  NewTrendViewController.swift
//  EbayApp
//
//  Created by MacBook  on 14.07.21.
//

import UIKit

class NewTrendViewController: BaseViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgFilter: UIImageView!
    @IBOutlet weak var imgSort: UIImageView!
    
    private var dataSource: NewTrendDataSource!
    private var viewModel: NewTrendViewModelProtocol!
    private var productManager: ProductsManagerProtocol!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()

        let rightButton = UIBarButtonItem(image: UIImage(named: "ic_cart"), style: .plain, target: self, action: "")
        self.navigationItem.rightBarButtonItem  = rightButton
    }
    
    private func configureCollectionView() {
        productManager = ProductManager()
        viewModel = NewTrendViewModel(with: productManager, controller: self)
        dataSource = NewTrendDataSource(with: collectionView, viewModel: viewModel)
        dataSource.refresh()
        
    }


}
