//
//  ImageCell.swift
//  EP102
//
//  Created by MacBook  on 14.07.21.
//

import UIKit

class ImageCell: UITableViewCell {

    @IBOutlet weak var backgView: UIView!
    @IBOutlet weak var imagePoster: UIImageView!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        backgView.setShadow(UIView: backgView,
                           viewCornerRadius: 4,
                           shadowOffset: CGSize(width: 0, height: 2),
                           opacity: 0.1,
                           shadowRadius: 4.0)
    }

    func configure(with item: Product?) {
        labelPrice.text = String(item?.price ?? 0)
        labelTitle.text = item?.title
        let imgURL = URL(string: item?.image ?? "")
        imagePoster.kf.setImage(with: imgURL)
        
    }
    
}
