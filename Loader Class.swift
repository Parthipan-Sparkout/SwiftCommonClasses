//
//  Loader Class.swift
//  PushyNotification
//
//  Created by Mac on 12/07/22.
//

import Foundation
import UIKit
import ImageIO

var vSpinner : UIView?
 
extension UIViewController {
    func showSpinner(loaderMessage: String? = nil) {
        let spinnerView = UIView.init(frame: self.view.bounds)
        spinnerView.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        let bgView = UIView()
        bgView.addCornerRadius()
        bgView.backgroundColor = UIColor.white.withAlphaComponent(0.8)
       // bgView.center = spinnerView.center
        
        if loaderMessage != nil {
            let loaderImage = UIImageView()
            bgView.addSubview(loaderImage)
            loaderImage.image = UIImage.gifImageWithName("SpinLoad")
            loaderImage.contentMode = .scaleAspectFit
            loaderImage.anchor(top: bgView.topAnchor, leading: bgView.leadingAnchor, bottom: nil, trailing: bgView.trailingAnchor, padding: UIEdgeInsets(top: 20, left: 20, bottom: 10, right: 20), size: CGSize(width: 60, height: 60))
            
            let messageLbl = UILabel()
            bgView.addSubview(messageLbl)
            messageLbl.anchor(top: loaderImage.bottomAnchor, leading: bgView.leadingAnchor, bottom: bgView.bottomAnchor, trailing: bgView.trailingAnchor, padding: UIEdgeInsets(top: 8, left: 12, bottom: 12, right: 12))
            messageLbl.text = loaderMessage
            messageLbl.textAlignment = .center
            messageLbl.font = Fonts.semiBoldFont()
            messageLbl.textColor = Const.ColorTheme.PRIMARY_COLOR
        } else {
            let loaderImage = UIImageView()
            bgView.addSubview(loaderImage)
            loaderImage.image = UIImage.gifImageWithName("spinLoader")
            loaderImage.contentMode = .scaleAspectFit
            loaderImage.centerInSuperview(size: CGSize(width: 70, height: 70))
        }
        
        
        DispatchQueue.main.async {
            spinnerView.addSubview(bgView)
            bgView.centerInSuperview(size: CGSize(width: 200, height: 140))
            self.view.addSubview(spinnerView)
        }
        
        vSpinner = spinnerView
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            vSpinner?.removeFromSuperview()
            vSpinner = nil
        }
    }
}


extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
