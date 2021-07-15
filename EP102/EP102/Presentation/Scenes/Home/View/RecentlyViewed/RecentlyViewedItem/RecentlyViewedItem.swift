//
//  RecentlyViewedItem.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import UIKit

class RecentlyViewedItem: UICollectionViewCell, CollectionViewCellConfigurable {

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


    func configure(with item: CellItem) {
        guard let model = item as? CellViewModel,
              let data = model.userData[.data] as? Product else {return}
        labelDescription.text = data.description
        let imageURL = URL(string: data.image ?? "")
        imagePoster.kf.setImage(with: imageURL)
    }
    
}
