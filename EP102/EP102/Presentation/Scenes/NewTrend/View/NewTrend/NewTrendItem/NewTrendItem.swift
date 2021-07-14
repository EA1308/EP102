//
//  NewTrendItem.swift
//  EbayApp
//
//  Created by MacBook  on 14.07.21.
//

import UIKit
import Kingfisher

class NewTrendItem: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var labelPrice: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.setShadow(UIView: backView,
                           viewCornerRadius: 4,
                           shadowOffset: CGSize(width: 0, height: 2),
                           opacity: 0.1,
                           shadowRadius: 4.0)
    }
    
    func configure(with item: Product?) {
        labelTitle.text = item?.title
        labelPrice.text = String(item?.price ?? 0)
        let imageURL = URL(string: item?.image ?? "")
        imgProduct.kf.setImage(with: imageURL)
    }
    
    
    @IBAction func buttonFavorite(_ sender: Any) {
        
    }
    
}
