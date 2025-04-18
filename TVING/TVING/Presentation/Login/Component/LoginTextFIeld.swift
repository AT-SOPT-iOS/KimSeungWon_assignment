//
//  LoginTextFIeld.swift
//  TVING
//
//  Created by 김승원 on 4/18/25.
//

import UIKit

import SnapKit

final class LoginTextField: UITextField {

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

private extension LoginTextField {
    func setTextField(textFieldType: TextFieldType) {
        placeholder = textFieldType.placeholder
        textColor = .gray2
        font = .pretendard(.semiBold, size: 15)
        tintColor = .primaryRed
        backgroundColor = .gray4
        
        configureDefaultTextField()
        addPadding(left: 22)
        setPlaceholderColor(.gray2)
        setCornerRadius(3)
        setBorder(0, borderColor: .gray2)
        
        isSecureTextEntry = textFieldType.isSecureTextEntry
        rightViewMode = textFieldType.rightViewMode
    }
}

extension LoginTextField {
    enum TextFieldType {
        case id
        case password
        
        var placeholder: String {
            switch self {
            case .id:
                return "아이디"
            case .password:
                return "비밀번호"
            }
        }
        
        var isSecureTextEntry: Bool {
            switch self {
            case .id:
                false
            case .password:
                true
            }
        }
        
        var rightViewMode: UITextField.ViewMode {
            switch self {
            case .id:
                return .whileEditing
            case .password:
                return .whileEditing
            }
        }
    }
}
