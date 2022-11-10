//
//  UIColor+Extension.swift
//  YaHala
//
//  Created by Keerthi on 10/05/21.
//  Copyright © 2021 Nikola. All rights reserved.
//

import UIKit

extension UIColor {
    
    //Hex string to UIColor
    func colorFromHex(hex: String) -> UIColor {
        var hexStr = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexStr.hasPrefix("#") {
            hexStr.remove(at: hexStr.startIndex)
        }
        
        if (hexStr.count) != 6 {
            return UIColor.black
        }
        
        var rgbValue: UInt32 = 0
        Scanner(string: hexStr).scanHexInt32(&rgbValue)
        
        return UIColor.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                            alpha: CGFloat(1.0))
    }
}

extension Const {
    public class ColorTheme {
        static let PRIMARY_COLOR = UIColor().colorFromHex(hex: "164194")
        static let BUTTON_COLOR = UIColor().colorFromHex(hex: "#4571C5")
        static let SECONDARY_COLOR = UIColor.white //UIColor().colorFromHex(hex: "435896")
        static let RED_COLOR = UIColor().colorFromHex(hex: "ff3131")
    }
}
