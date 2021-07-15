//
//  SavedItem.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import UIKit
import Kingfisher

class SavedItem: UICollectionViewCell, CollectionViewCellConfigurable {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var buttonSeeMore: UIButton!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.setShadow(UIView: backView,
                           viewCornerRadius: 4,
                           shadowOffset: CGSize(width: 0, height: 2),
                           opacity: 0.1,
                           shadowRadius: 4.0)
    }
  
    func configure(with item: CellItem) {
        guard let model = item as? CellViewModel,
              let data = model.userData[.data] as? SavedProduct else {return}
        labelPrice.text = data.price
        labelTitle.text = data.name
        let imageURL = URL(string: data.image ?? "")
        imageProduct.kf.setImage(with: imageURL)
    }
    

    
}
