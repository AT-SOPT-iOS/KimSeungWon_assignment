//
//  TvingTextFIeld.swift
//  TVING
//
//  Created by 김승원 on 4/18/25.
//

import UIKit

import SnapKit

final class TvingTextField: UITextField {

    // MARK: - Initializer
    
    init(_ textFieldType: TextFieldType) {
        super.init(frame: .zero)
        
        setTextField(textFieldType: textFieldType)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Functions

private extension TvingTextField {
    func setTextField(textFieldType: TextFieldType) {
        configureDefaultTextField()
        addPadding(left: 22)
        setCornerRadius(3)
        setBorder(0, borderColor: .gray2)
        
        tintColor = .primaryRed
        font = textFieldType.font
        textColor = textFieldType.textColor
        backgroundColor = textFieldType.backgroundColor
        placeholder = textFieldType.placeholder
        setPlaceholderColor(textFieldType.placeholderColor)
        isSecureTextEntry = textFieldType.isSecureTextEntry
        rightViewMode = textFieldType.rightViewMode
        keyboardType = textFieldType.keyboardType
    }
}

extension TvingTextField {
    enum TextFieldType {
        case id
        case password
        case nickname
        case search
        
        var font: UIFont {
            switch self {
            case .id:
                return .pretendard(.semiBold, size: 15)
            case .password:
                return .pretendard(.semiBold, size: 15)
            case .nickname:
                return .pretendard(.regular, size: 14)
            case .search:
                return .pretendard(.semiBold, size: 15)
            }
        }
        
        var textColor: UIColor {
            switch self {
            case .id:
                return .gray2
            case .password:
                return .gray2
            case .nickname:
                return .primaryBlack
            case .search:
                return .gray2
            }
        }
        
        var backgroundColor: UIColor {
            switch self {
            case .id:
                return .gray4
            case .password:
                return .gray4
            case .nickname:
                return .gray1
            case .search:
                return .gray4
            }
        }
        var placeholder: String {
            switch self {
            case .id:
                return "아이디"
            case .password:
                return "비밀번호"
            case .nickname:
                return "닉네임"
            case .search:
                return "yyyymmdd형식으로 검색"
            }
        }
        
        var placeholderColor: UIColor {
            switch self {
            case .id:
                return .gray2
            case .password:
                return .gray2
            case .nickname:
                return .gray2
            case .search:
                return .gray2
            }
        }
        
        var isSecureTextEntry: Bool {
            switch self {
            case .id:
                return false
            case .password:
                return true
            case .nickname:
                return false
            case .search:
                return false
            }
        }
        
        var rightViewMode: UITextField.ViewMode {
            switch self {
            case .id:
                return .whileEditing
            case .password:
                return .whileEditing
            case .nickname:
                return .whileEditing
            case .search:
                return .whileEditing
            }
        }
        
        var keyboardType: UIKeyboardType {
            switch self {
            case .id:
                return .emailAddress
            case .password:
                return .default
            case .nickname:
                return .default
            case .search:
                return .default
            }
        }
    }
}
