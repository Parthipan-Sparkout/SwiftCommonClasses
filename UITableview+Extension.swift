//
//  UITableview+Extension.swift
//  Glint-Partner
//
//  Created by Sparkout on 14/11/22.
//  Copyright © 2022 Sutharshan. All rights reserved.
//

import UIKit

extension UITableViewCell: NibLoadableView, TableReusableView { }

extension UITableView {

    func registerNib<T: UITableViewCell>(_ type: T.Type) {
        register(T.nib, forCellReuseIdentifier: T.identifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(_ type: T.Type, indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else { return T() }
        return cell
    }
}
