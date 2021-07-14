//
//  UIView + Extension.swift
//  EbayApp
//
//  Created by MacBook  on 13.07.21.
//

import UIKit


extension UIView {
    func setShadow(UIView: UIView, viewCornerRadius: CGFloat, shadowOffset: CGSize, opacity: Float, shadowRadius: CGFloat) {
        UIView.layer.shadowColor = UIColor.black.cgColor
        UIView.layer.shadowOffset = shadowOffset
        UIView.layer.shadowOpacity = opacity
        UIView.layer.shadowRadius = shadowRadius
        UIView.layer.cornerRadius = viewCornerRadius
    }
}
