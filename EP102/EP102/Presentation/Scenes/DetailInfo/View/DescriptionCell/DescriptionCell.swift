//
//  DescriptionCell.swift
//  EP102
//
//  Created by MacBook  on 14.07.21.
//

import UIKit

class DescriptionCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var labelDesc1: UILabel!
    @IBOutlet weak var labelDesc2: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.setShadow(UIView: backView,
                           viewCornerRadius: 4,
                           shadowOffset: CGSize(width: 0, height: 2),
                           opacity: 0.1,
                           shadowRadius: 4.0)
        // Initialization code
    }
    
    func configure(with item: Product?) {
        labelDesc1.text = item?.description
        labelDesc2.text = item?.description
    }

    
}
