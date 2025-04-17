//
//  UITextField+.swift
//  TVING
//
//  Created by 김승원 on 4/17/25.
//

import UIKit

extension UITextField {
    func configureDefaultTextField() {
        self.autocorrectionType = .no
        self.spellCheckingType = .no
        self.autocapitalizationType = .none
        self.clearButtonMode = .always
        self.clearsOnBeginEditing = false
    }
    
    func addPadding(left: CGFloat? = nil, right: CGFloat? = nil) {
        if let left {
            leftView = UIView(frame: CGRect(x: 0, y: 0, width: left, height: 0))
            leftViewMode = .always
        }
        
        if let right {
            rightView = UIView(frame: CGRect(x: 0, y: 0, width: right, height: 0))
            rightViewMode = .always
        }
    }
}
