//
//  BrandsItem.swift
//  EP102
//
//  Created by MacBook  on 14.07.21.
//

import UIKit

class BrandsItem: UICollectionViewCell, CollectionViewCellConfigurable {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var labelBrand: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

        backView.layer.cornerRadius = 8

        
    }

    func configure(with item: CellItem) {
        guard let model = item as? CellViewModel,
              let data = model.userData[.data] as? Brand else {return}
        labelBrand.text = data.name
    }
}
