//
//  UICollectionView+Extension.swift
//  YaHala
//
//  Created by Keerthi on 18/05/21.
//  Copyright © 2021 Nikola. All rights reserved.
//

import Foundation
import Localize_Swift
//
//extension UICollectionViewFlowLayout {
//    open override var flipsHorizontallyInOppositeLayoutDirection: Bool {
//        return (Localize.currentLanguage() == "ar")
//    }
//}

extension UICollectionView {

    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont.boldSystemFont(ofSize: 15)
        messageLabel.sizeToFit()

        self.backgroundView = messageLabel;
    }

    func restore() {
        self.backgroundView = nil
    }
}
