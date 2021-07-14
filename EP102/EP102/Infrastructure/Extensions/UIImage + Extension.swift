//
//  UIImage + Extension.swift
//  BookStoreApp
//
//  Created by MacBook  on 12.07.21.
//

import UIKit

extension UIImageView {

    func makeRounded() {

        self.layer.borderWidth = 2
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.systemBlue.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        
        self.clipsToBounds = true
    }
}
