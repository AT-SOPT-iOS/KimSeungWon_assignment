//
//  UIViewController+.swift
//  TVING
//
//  Created by 김승원 on 4/17/25.
//

import UIKit

extension UIViewController {
    /// 화면 터치시 키보드를 내리는 함수입니다
    func hideKeyboardWhenDidTap(cancelsTouches cancelsTouchesInView : Bool = false) {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = cancelsTouchesInView
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc
    private func dismissKeyboard() {
        view.endEditing(true)
    }
}
