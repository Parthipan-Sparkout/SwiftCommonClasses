//
//  UIFont+Extension.swift
//  GPSTransport
//
//  Created by Mac on 01/09/22.
//  Copyright © 2022 Nikola. All rights reserved.
//

public class AppFonts {
    public static let FONT_REGULAR = "Neo Sans Arabic Regular"
    public static let FONT_SEMIBOLD = "Neo Sans Arabic Medium"
    public static let FONT_BOLD = "NeoSansArabic-Bold"
}

class Fonts {
    class func headerFont() -> UIFont? {
        return UIFont(name: AppFonts.FONT_SEMIBOLD, size: 28)
    }
    
    class func descriptionFont() -> UIFont? {
        return UIFont(name: AppFonts.FONT_REGULAR, size: 14)
    }
    
    class func regularFont(size: Double = 16) -> UIFont? {
        return UIFont(name: AppFonts.FONT_REGULAR, size: size)
    }
    
    class func semiBoldFont(size: Double = 16) -> UIFont? {
        return UIFont(name: AppFonts.FONT_SEMIBOLD, size: size)
    }
    
    class func boldFont(size: Double = 16) -> UIFont? {
        return UIFont(name: AppFonts.FONT_BOLD, size: size)
    }
    
    class func normalSemiBoldFont() -> UIFont? {
        return UIFont(name: AppFonts.FONT_SEMIBOLD, size: 18)
    }
}
