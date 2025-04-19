//
//  UIView+.swift
//  TVING
//
//  Created by 김승원 on 4/17/25.
//

import UIKit

extension UIView {
    /// addSubview의 복수형 함수입니다
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
    
    /// border를 설정하는 함수입니다
    func setBorder(_ borderWidth: CGFloat = 1, borderColor: UIColor = .gray4) {
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}
