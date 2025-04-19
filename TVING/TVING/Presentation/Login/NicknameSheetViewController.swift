//
//  NicknameSheetViewController.swift
//  TVING
//
//  Created by 김승원 on 4/19/25.
//

import UIKit

import SnapKit
import Then

class NicknameSheetViewController: UIViewController {
    
    // MARK: - UI Properties
    
    private let titleLabel = UILabel()
    
    private let nicknameTextField = TvingTextField(.nickname)
    
    private let saveButton = TvingRedButton("저장하기", isEnabled: false)
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setStyle()
        setUI()
        setLayout()
        setDelegate()
        setAction()
        hideKeyboardWhenDidTap()
    }
}

// MARK: - UI Setting

private extension NicknameSheetViewController {
    func setStyle() {
        view.do {
            $0.backgroundColor = .primaryWhite
        }
        
        titleLabel.do {
            $0.text = "닉네임을 입력해주세요"
            $0.font = .pretendard(.regular, size: 23)
            $0.textColor = .primaryBlack
        }
    }
    
    func setUI() {
        view.addSubviews(titleLabel, nicknameTextField, saveButton)
    }
    
    func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(50)
            $0.horizontalEdges.equalToSuperview().inset(20)
        }
        
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(21)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
        
        saveButton.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(11)
            $0.horizontalEdges.equalToSuperview().inset(20)
            $0.height.equalTo(52)
        }
    }
}

// MARK: - Functions

extension NicknameSheetViewController {
    private func setDelegate() {
        nicknameTextField.delegate = self
    }
    
    private func setAction() {
        nicknameTextField.addTarget(self, action: #selector(textFieldEditingChanged), for: .editingChanged)
        
        saveButton.addTarget(self, action: #selector(saveButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func textFieldEditingChanged() {
        var isButtonEnabled = false
        
        if let nickname = nicknameTextField.text, !nickname.isEmpty {
            isButtonEnabled = true
        }
        
        saveButton.isEnabled = isButtonEnabled
    }
    
    @objc
    private func saveButtonDidTap() {
        self.dismiss(animated: true)
    }
}

// MARK: - UITextFieldDelegate

extension NicknameSheetViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nicknameTextField.resignFirstResponder()
        return true
    }
}
