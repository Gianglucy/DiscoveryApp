//
//  UIColor+Extension.swift
//  DiscoveryApp
//
//  Created by Lauv Edward on 04/07/2021.
//
import UIKit
extension UIColor {
    convenience init(hexFromString: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hexFromString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }
        
        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)
        
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}
