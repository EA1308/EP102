//
//  UITableViewCell + Extension.swift
//  BookStoreApp
//
//  Created by MacBook  on 12.07.21.
//

import UIKit


extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
    
    static func nib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle.main)
    }
}


