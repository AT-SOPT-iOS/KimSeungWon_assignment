//
//  TvingRedButton.swift
//  TVING
//
//  Created by 김승원 on 4/18/25.
//

import UIKit

final class TvingRedButton: UIButton {

    // MARK: - Properties
    
    override var isEnabled: Bool {
        didSet {
            updateButton()
        }
    }
    
    init(_ title: String, isEnabled: Bool = true) {
        super.init(frame: .zero)
        
        setButton(title: title, isEnabled: isEnabled)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Functions

private extension TvingRedButton {
    func setButton(title: String, isEnabled: Bool) {
        self.isEnabled = isEnabled
        setTitle(title, for: .normal)
        titleLabel?.font = .pretendard(.semiBold, size: 14)
        setCornerRadius(3)
    }
    
    func updateButton() {
        /*
         Todo: 과연 좋은 코드인가 생각....
         */
        setBorder(isEnabled ? 0 : 1, borderColor: .gray4)
        backgroundColor = isEnabled ? .primaryRed : .primaryBlack
        setTitleColor(isEnabled ? .primaryWhite : .gray2, for: .normal)
    }
}
