//
//  ShoppingHabitsItem.swift
//  EP102
//
//  Created by MacBook  on 15.07.21.
//

import UIKit

class ShoppingHabitsItem: UICollectionViewCell {

    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var backView: UIView!
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
        labelPrice.text = "$ \(item?.price ?? 0)"
        labelTitle.text = item?.title
        let imageURL = URL(string: item?.image ?? "")
        imageProduct.kf.setImage(with: imageURL)
    }
}
