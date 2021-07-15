//
//  WideCell.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import UIKit

class WideCell: UITableViewCell, CellConfigurable {

    @IBOutlet weak var imagePoster: UIImageView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var labelTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        backView.setShadow(UIView: backView,
                           viewCornerRadius: 4,
                           shadowOffset: CGSize(width: 0, height: 2),
                           opacity: 0.1,
                           shadowRadius: 4.0)
    }
    

    
    func configureNewTrend() {
        imagePoster.image = UIImage(named: "img_newTrend")
        labelTitle.text = "New Trend"
    }
    func configureStrippes() {
        imagePoster.image = UIImage(named: "img_stripples")
        labelTitle.text = "Strippes"
    }
    func configureSummerSea() {
        imagePoster.image = UIImage(named: "img_summerSea")
        labelTitle.text = "Summer Sea"
    }
    
  
    func configure(with item: CellItem) {
        guard let model = item as? CellViewModel,
              let data = model.userData[.data] as? WideCellData else {return}
        labelTitle.text = data.title
        imagePoster.image = UIImage(named: data.image)
    }
}

struct WideCellData {
    let title: String
    let image: String
}
