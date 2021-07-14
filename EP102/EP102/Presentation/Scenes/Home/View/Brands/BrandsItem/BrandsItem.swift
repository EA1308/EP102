//
//  BrandsItem.swift
//  EP102
//
//  Created by MacBook  on 14.07.21.
//

import UIKit

class BrandsItem: UICollectionViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var labelBrand: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//
//        backView.frame.size.width = labelBrand.frame.size.width
//        backView.frame.size.height = labelBrand.frame.size.height
        backView.layer.cornerRadius = 8

        
    }

    func configure(with item: Brand?) {
        labelBrand.text = item?.name
    }
    
}
