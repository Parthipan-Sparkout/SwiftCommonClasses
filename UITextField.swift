//
//  UITextView.swift
//  YaHala
//
//  Created by Sutharshan Ram on 31/07/17.
//  Copyright © 2017 Sutharshan. All rights reserved.
//

import UIKit



@IBDesignable class CustomTextField: UITextField {

    @IBInspectable public var borderColor1: UIColor? {
        didSet {
            self.borderStyle = .none
            self.layer.masksToBounds = false
            self.layer.shadowColor = borderColor1?.cgColor
            self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
            self.layer.shadowOpacity = 2.0
            self.layer.shadowRadius = 0.0
        }
    }
    
    
}

extension UITextField {
    
    enum Direction {
            case left
            case right
        }
    
    func addDoneButtonOnKeyboard()
    {
        let doneToolbar: UIToolbar = UIToolbar(frame: CGRectMake(0, 0, 320, 50))
        doneToolbar.barStyle = UIBarStyle.blackTranslucent
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
        let done: UIBarButtonItem = UIBarButtonItem(title: "Done".localized(), style: UIBarButtonItem.Style.done, target: self, action: #selector(UIResponder.resignFirstResponder))        
        var items = [AnyObject]()
        items.append(flexSpace)
        items.append(done)
        
        doneToolbar.items = items as! [UIBarButtonItem]
        doneToolbar.sizeToFit()
        if let accessorizedView = self as? UITextView {
            accessorizedView.inputAccessoryView = doneToolbar
            accessorizedView.inputAccessoryView = doneToolbar
        } else if let accessorizedView = self as? UITextField {
            accessorizedView.inputAccessoryView = doneToolbar
            accessorizedView.inputAccessoryView = doneToolbar
        }
    }
    
    
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    
    // Password show hide extensions
        private func setPasswordToggleImage(_ button: UIButton) {
            let statusIcon = isSecureTextEntry ? UIImage(named: "eye") : UIImage(named: "hide")
            button.setImage(statusIcon, for: .normal)
        }
        
        func enablePasswordToggle() {
            let button = UIButton(type: .custom)
            setPasswordToggleImage(button)
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
            button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: CGFloat(5), width: CGFloat(25), height: CGFloat(25))
            button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
            self.rightView = button
            self.rightViewMode = .always
        }
        
        @objc private func togglePasswordView(_ sender: UIButton) {
            self.isSecureTextEntry = !self.isSecureTextEntry
            setPasswordToggleImage(sender)
        }

    //Add image to textfield
    func withImage(direction: Direction,
                       image: UIImage,
                       colorSeparator: UIColor,
                       colorBorder: UIColor,
                       imageSize: CGFloat = 20,
                       position: CGPoint = CGPoint(x: 8, y: 8)){
            let mainView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
            mainView.layer.cornerRadius = 5
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 45))
            view.backgroundColor = .clear
            view.clipsToBounds = true
            view.layer.cornerRadius = 5
            view.layer.borderWidth = CGFloat(0.5)
            view.layer.borderColor = colorBorder.cgColor
            mainView.addSubview(view)
            
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            imageView.frame = CGRect(origin: position, size: CGSize(width: imageSize, height: imageSize))
            view.addSubview(imageView)
            
            let seperatorView = UIView()
            seperatorView.backgroundColor = colorSeparator
            mainView.addSubview(seperatorView)
            
            if Direction.left == direction { // image left
                seperatorView.frame = CGRect(x: 45, y: 0, width: 5, height: 45)
                self.leftViewMode = .always
                self.leftView = mainView
            } else { // image right
                seperatorView.frame = CGRect(x: 0, y: 0, width: 5, height: 45)
                self.rightViewMode = .always
                self.rightView = mainView
            }
            
            self.layer.borderColor = colorBorder.cgColor
            self.layer.borderWidth = CGFloat(0.5)
            self.layer.cornerRadius = 5
        }
    
    // MARK: Date picker
    func datePicker<T>(target: T,
                       doneAction: Selector,
                       cancelAction: Selector,
                       valueChanged: Selector,
                       datePickerMode: UIDatePicker.Mode = .date) {
        // Code goes here
        let screenWidth = UIScreen.main.bounds.width
        let datePicker = UIDatePicker()
        datePicker.maximumDate = Date()
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        } else {
            
        }
       
        datePicker.datePickerMode = datePickerMode
        self.inputView = datePicker
        datePicker.addTarget(target, action: valueChanged, for: .valueChanged)
        let toolBar = UIToolbar(frame: CGRect(x: 0,
                                              y: 0,
                                              width: screenWidth,
                                              height: 44))
        toolBar.setItems([buttonItem(withSystemItemStyle: .cancel),
                          buttonItem(withSystemItemStyle: .flexibleSpace),
                          buttonItem(withSystemItemStyle: .done)],
                         animated: true)
        self.inputAccessoryView = toolBar
        
        func buttonItem(withSystemItemStyle style: UIBarButtonItem.SystemItem) -> UIBarButtonItem {
            let buttonTarget = style == .flexibleSpace ? nil : target
            let action: Selector? = {
                switch style {
                case .cancel:
                    return cancelAction
                case .done:
                    return doneAction
                default:
                    return nil
                }
            }()
            
            let barButtonItem = UIBarButtonItem(barButtonSystemItem: style,
                                                target: buttonTarget,
                                                action: action)
            
            
            return barButtonItem
        }
    }
}



