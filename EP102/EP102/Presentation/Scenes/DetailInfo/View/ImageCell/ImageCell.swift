//
//  ImageCell.swift
//  EP102
//
//  Created by MacBook  on 14.07.21.
//

import UIKit

class ImageCell: UITableViewCell {

    @IBOutlet weak var imagePoster: UIImageView!
    @IBOutlet weak var labelPrice: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(with item: Product?) {
        
    }
    
}
