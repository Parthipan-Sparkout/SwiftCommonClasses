//
//  UIView.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 11/5/15.
//  Copyright © 2015 Yuji Hato. All rights reserved.
//

import UIKit

extension UIView {
    class func loadNib<T: UIView>(_ viewType: T.Type) -> T {
        let className = String.className(viewType)
        return Bundle(for: viewType).loadNibNamed(className, owner: nil, options: nil)!.first as! T
    }
    
    class func loadNib() -> Self {
        return loadNib(self)
    }
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    func addCornerRadius (cornerRadius: CGFloat = 8) {
        clipsToBounds = false
        layer.cornerRadius = cornerRadius
    }
    
    func addBorder( color: UIColor,  width: CGFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
}



//@IBDesignable class CustomViewNew: UIView {
//    
//    @IBInspectable public var cornerRadiusuiView: CGFloat = 0.0 {
//        
//        didSet {
//            layer.cornerRadius = cornerRadiusuiView
//            
//            
//        }
//    }
//    
//}
//
