//
//  UIView+.swift
//  TVING
//
//  Created by 김승원 on 4/17/25.
//

import UIKit

extension UIView {
    /// UIView에 subview를 한번에 addSubview하는 함수입니다
    func addSubviews(_ views: UIView...) {
        views.forEach {
            addSubview($0)
        }
    }
    
    /// cornerRadius를 설정하는 함수입니다
    func setCornerRadius(
        _ cornerRadius: CGFloat,
        maskedCorners: CACornerMask = [
            .layerMaxXMaxYCorner,
            .layerMinXMaxYCorner,
            .layerMaxXMinYCorner,
            .layerMinXMinYCorner
        ]
    ) {
        clipsToBounds = true
        layer.cornerRadius = cornerRadius
        layer.maskedCorners = CACornerMask(arrayLiteral: maskedCorners)
    }
    
    func setBorder(_ borderWidth: CGFloat = 1, borderColor: UIColor = .gray4) {
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}
