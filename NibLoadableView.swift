//
//  NibLoadableView.swift
//  Glint-Partner
//
//  Created by Sparkout on 14/11/22.
//  Copyright © 2022 Sutharshan. All rights reserved.
//

import UIKit

protocol NibLoadableView: AnyObject { }

extension NibLoadableView where Self: UIView {
    static var nib: UINib { return UINib(nibName: String(describing: self), bundle: .main) }
}
