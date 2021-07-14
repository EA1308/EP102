//
//  UIColor + Extension.swift
//  Moviez
//
//  Created by MacBook  on 05.06.21.
//

import UIKit

extension UIColor {

    public convenience init(r red: Float, g green: Float, b blue: Float, alpha: CGFloat = 1.0) {
        self.init(red: CGFloat(red/255.0), green: CGFloat(green/255.0), blue: CGFloat(blue/255.0), alpha: alpha)
    }

    public convenience init(hex: String) {
        let hexPrefix = "0x"
        let start = hex.index(hex.startIndex, offsetBy: 2)
        let end = hex.endIndex
        var chars = Array(hex.hasPrefix(hexPrefix) ? String(hex[start..<end]) : hex)
        
        var red: CGFloat = 0, green: CGFloat = 0, blue: CGFloat = 0, alpha: CGFloat = 1
        switch chars.count {
        case 3:
            chars = [chars[0], chars[0], chars[1], chars[1], chars[2], chars[2]]
            fallthrough
        case 6:
            chars = ["F","F"] + chars
            fallthrough
        case 8:
            alpha = CGFloat(strtoul(String(chars[0...1]), nil, 16)) / 255
            red   = CGFloat(strtoul(String(chars[2...3]), nil, 16)) / 255
            green = CGFloat(strtoul(String(chars[4...5]), nil, 16)) / 255
            blue  = CGFloat(strtoul(String(chars[6...7]), nil, 16)) / 255
        default:
            alpha = 0
        }
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
