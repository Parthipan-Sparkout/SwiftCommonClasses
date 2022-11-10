//
//  UIViewController+Extension.swift
//  Glint-Taxi
//
//  Created by Sparkout on 18/10/22.
//  Copyright © 2022 Nikola. All rights reserved.
//

import Foundation

extension UIViewController {
    var screenSize: CGSize { UIScreen.main.bounds.size }
    
    func hideNavigationBar(){
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    func showNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    static func instantiate<T: UIViewController>(storyboard: String = String(describing: T.self),
                                                 id: String = String(describing: T.self),
                                                 bundle: Bundle = .main) -> T {
        let sb = UIStoryboard(name: storyboard, bundle: bundle)
        let vc = sb.instantiateViewController(withIdentifier: id) as? T
        return vc ?? T()
    }
}

