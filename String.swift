//
//  StringExtension.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/22/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

import Foundation

extension String {
    static func className(_ aClass: AnyClass) -> String {
        return NSStringFromClass(aClass).components(separatedBy: ".").last!
    }
    
    func substring(_ from: Int) -> String {
        return self.substring(from: self.index(self.startIndex, offsetBy: from))
    }
    
    var length: Int {
        return self.count
    }
    
    func encodeUrl() -> String
    {
        return self.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
    }
    func decodeUrl() -> String
    {
        return self.removingPercentEncoding!
    }
    
    var containSpecialChar: Bool {
        range(of: ".*[^A-Za-z0-9_].*", options: .regularExpression) != nil
    }

}


extension String {
    func containsEmoji() -> Bool {
        for scalar in unicodeScalars {
            switch scalar.value {
            case 0x3030, 0x00AE, 0x00A9,    // Special Characters
                0x1D000...0x1F77F,          // Emoticons
                0x2100...0x27BF,            // Misc symbols and Dingbats
                0xFE00...0xFE0F,            // Variation Selectors
                0x1F900...0x1F9FF:          // Supplemental Symbols and Pictographs
                return true
            default:
                continue
            }
        }
        return false
    }
}

extension String {
    func decode() -> String {
        let data = self.data(using: .utf8)!
        return String(data: data, encoding: .nonLossyASCII) ?? self
    }

    // If string contains emoji's, converting to unicodes
    func encode() -> String {
        let data = self.data(using: .nonLossyASCII, allowLossyConversion: true)!
        return String(data: data, encoding: .utf8)!
    }
}

extension String {
    func getAttributedString() -> NSMutableAttributedString {
        return NSMutableAttributedString(string: self)
    }
}

extension NSMutableAttributedString {
    func apply(attribute: [NSAttributedString.Key: Any], subString: String)  {
        if let range = self.string.range(of: subString) {
            self.apply(attribute: attribute, onRange: NSRange(range, in: self.string))
        }
    }

    func apply(attribute: [NSAttributedString.Key: Any], onRange range: NSRange) {
        if range.location != NSNotFound {
            self.setAttributes(attribute, range: range)
        }
    }

    func apply(color: UIColor, subString: String) {
        if let range = self.string.range(of: subString) {
            self.apply(color: color, onRange: NSRange(range, in:self.string))
        }
    }

    func apply(color: UIColor, onRange: NSRange) {
        self.addAttributes([NSAttributedString.Key.foregroundColor: color],
                           range: onRange)
    }

    func apply(font: UIFont, subString: String)  {
        if let range = self.string.range(of: subString) {
            self.apply(font: font, onRange: NSRange(range, in: self.string))
        }
    }

    func apply(font: UIFont, onRange: NSRange) {
        self.addAttributes([NSAttributedString.Key.font: font], range: onRange)
    }
}

extension String {
    var localized: String {
        if let bundle = EatZillaTheme.bundle {
            let str = NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
            return str
        } else {
            return ""
        }
    }
}

extension String {
    var detectDate: Date? {
        let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.date.rawValue)
        let matches = detector?.matches(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count))
        return matches?.first?.date
    }
    
    func forceUnicodeRTL() -> String {
        return "\u{200E}\(self)\u{202C}"
    }
}

extension String {
    // formatting text for currency textField
    func currencyFormatting() -> String {
        if let value = Double(self) {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            if let str = formatter.string(for: value) {
                return str
            }
        }
        return ""
    }
}

extension Bundle {
    var appVersion: String {
        let info = Bundle.main.infoDictionary
        return info?["CFBundleShortVersionString"] as! String
    }
    
    var bundleIdentifier: String {
        let info = Bundle.main.infoDictionary
        return info?["CFBundleIdentifier"] as! String
    }
    
    var mapboxToken: String {
        return object(forInfoDictionaryKey: "MGLMapboxAccessToken") as? String ?? ""
    }

}

extension String {
    
    func contains(find: String) -> Bool{
        return self.range(of: find) != nil
    }
    func containsIgnoringCase(find: String) -> Bool{
        return self.range(of: find, options: .caseInsensitive) != nil
    }
}

