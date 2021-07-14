//
//  ProductItem.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import UIKit
import Kingfisher

class ProductItem: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var labelProductTitle: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var imageProduct: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.setShadow(UIView: backView,
                           viewCornerRadius: 4,
                           shadowOffset: CGSize(width: 0, height: 2),
                           opacity: 0.1,
                           shadowRadius: 4.0)
    }
    
    
    func configure(with item: Product?) {
        labelProductTitle.text = item?.category
        labelDescription.text = item?.description
        let imageURL = URL(string: item?.image ?? "")
        imageProduct.kf.setImage(with: imageURL)
        
    }

}
