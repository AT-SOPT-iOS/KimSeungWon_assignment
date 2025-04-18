//
//  UIStackView+.swift
//  TVING
//
//  Created by 김승원 on 4/17/25.
//

import UIKit

extension UIStackView {
    /// UIStackView의 subview를 한번에 여러 개 addArrangedSubview하는 함수입니다
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}
