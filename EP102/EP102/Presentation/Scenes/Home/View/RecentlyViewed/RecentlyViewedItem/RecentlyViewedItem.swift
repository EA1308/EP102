//
//  RecentlyViewedItem.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import UIKit

class RecentlyViewedItem: UICollectionViewCell {

    @IBOutlet weak var labelDescription: UILabel!
    @IBOutlet weak var imagePoster: UIImageView!
    @IBOutlet weak var backView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.setShadow(UIView: backView,
                           viewCornerRadius: 4,
                           shadowOffset: CGSize(width: 0, height: 2),
                           opacity: 0.1,
                           shadowRadius: 4.0)
    }

    func configure(with item: Product?) {
        labelDescription.text = item?.description
        let imageURL = URL(string: item?.image ?? "")
        imagePoster.kf.setImage(with: imageURL)
    }
    
}
