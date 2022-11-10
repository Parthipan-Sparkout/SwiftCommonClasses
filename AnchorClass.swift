//
//  AnchorClass.swift
//  GPSTransport
//
//  Created by Sparkout on 07/09/22.
//  Copyright © 2022 Nikola. All rights reserved.
//

import Foundation
import UIKit

struct AnchorConstraints {
    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
}
enum anchorEntity {
    case width
    case height
    case both
}

extension UIView {
    
  @discardableResult func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchorConstraints {
        
        translatesAutoresizingMaskIntoConstraints = false
        var anchorConstraints = AnchorConstraints()
        
        if let top = top {
            anchorConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
        }
        
        if let leading = leading {
            anchorConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
        }
        
        
        if let trailing = trailing {
            anchorConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
        }
        
        if size.width != 0 {
            anchorConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
        }
        
        if size.height != 0 {
            anchorConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
        }else {
            if let bottom = bottom {
                anchorConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
            }

    }
        
        [anchorConstraints.top, anchorConstraints.leading, anchorConstraints.bottom, anchorConstraints.trailing, anchorConstraints.width, anchorConstraints.height].forEach{ $0?.isActive = true }
        
        return anchorConstraints
    }
    
    
    func fillSuperview(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
        }
        
        if let superviewBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
        }
        
        if let superviewLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
        }
        
        if let superviewTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
    
    
    func centerInSuperview(size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superviewCenterXAnchor = superview?.centerXAnchor {
            centerXAnchor.constraint(equalTo: superviewCenterXAnchor).isActive = true
        }
        
        if let superviewCenterYAnchor = superview?.centerYAnchor {
            centerYAnchor.constraint(equalTo: superviewCenterYAnchor).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func equalWidthsORHeights(toview: UIView, entity:anchorEntity) {
        translatesAutoresizingMaskIntoConstraints = false
        switch entity {
        case .both:
            if let superviewWidthAnchor = superview?.widthAnchor, let superviewHeightAnchor = superview?.heightAnchor{
                widthAnchor.constraint(equalTo: superviewWidthAnchor).isActive = true
                heightAnchor.constraint(equalTo: superviewHeightAnchor).isActive = true
            }
        case .width:
            if let superviewWidthAnchor = superview?.widthAnchor {
                widthAnchor.constraint(equalTo: superviewWidthAnchor).isActive = true
            }
        case .height:
            if let superviewHeightAnchor = superview?.heightAnchor {
                heightAnchor.constraint(equalTo: superviewHeightAnchor).isActive = true
            }
        }
    }
}
