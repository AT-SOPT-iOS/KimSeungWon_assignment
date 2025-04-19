//
//  UILabel+.swift
//  TVING
//
//  Created by 김승원 on 4/19/25.
//

import UIKit

extension UILabel {
    /// UILabel에 lineSpacing을 적용하는 함수입니다.
    ///
    /// 추후.. 모든 text에 lineHeight, lineSpacing을 적용할 수 있도록
    /// (별로 좋은 코드가 아닌 거 같음)
    func setLineSpacing(spacing: CGFloat) {
        guard let text else { return }
        
        let attributeString = NSMutableAttributedString(string: text)
        let style = NSMutableParagraphStyle()
        style.lineSpacing = spacing
        attributeString.addAttribute(.paragraphStyle,
                                     value: style,
                                     range: NSRange(location: 0, length: attributeString.length))
        attributedText = attributeString
    }
}
